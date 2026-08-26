//
//  AppComposition.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import SwiftUI
import Combine

/// Composition root **одной сцены**: здесь собирается граф навигации
/// и связываются его участники.
///
/// Создаётся через `@StateObject` в `AppCoordinatorView`, то есть по одному
/// экземпляру на окно. На iPad это принципиально: многооконность включена
/// (`UIApplicationSupportsMultipleScenes`), и каждое окно должно иметь свой
/// выбранный таб, свой стек и свои модалки. Один общий экземпляр на процесс
/// превратил бы второе окно в зеркало первого.
///
/// Сервисы живут дольше: `AppContainer` создаётся один раз в
/// `EnterpriseCoordinatorApp` и приезжает сюда параметром — второе окно не
/// должно поднимать вторую сессию или второй сетевой клиент.
///
/// `ObservableObject` здесь не потому, что класс что-то публикует (он не
/// публикует ничего), а потому что этого требует `@StateObject` — единственный
/// способ получить хранение с временем жизни сцены и ровно одну сборку графа.
/// Не «чистите» этот конформанс: вместе с ним уедет и привязка к сцене.
final class AppComposition: ObservableObject {

    // MARK: - Coordinators

    let coordinator: TabBarCoordinator

    // MARK: - Routers

    let home: HomeRouter
    let favorites: FavoritesRouter
    let history: HistoryRouter
    let profile: ProfileRouter
    let globalModal: GlobalModalRouter

    // MARK: - Init

    init(container: AppContainer) {
        let coordinator = TabBarCoordinator()
        self.coordinator = coordinator

        self.home = HomeRouter(dependencies: container, coordinator: coordinator.home)
        self.favorites = FavoritesRouter(dependencies: container, coordinator: coordinator.favorites)
        self.history = HistoryRouter(dependencies: container, coordinator: coordinator.history)
        self.profile = ProfileRouter(dependencies: container, coordinator: coordinator.profile)
        self.globalModal = GlobalModalRouter(dependencies: container)

        wireAnalytics(analytics: container.analytics)
    }
}

// MARK: - Wiring

private extension AppComposition {

    /// Связывает навигационные события с аналитикой. Именование событий фичи
    /// живёт в её роутере, здесь — только соединение участников.
    ///
    /// Обработчики захватывают сервис, но не координаторы, иначе получился бы
    /// цикл ссылок и окно на iPad не освобождалось бы при закрытии.
    func wireAnalytics(analytics: AnalyticsServicing) {
        coordinator.home.onEvent = home.makeEventHandler()
        coordinator.favorites.onEvent = favorites.makeEventHandler()
        coordinator.history.onEvent = history.makeEventHandler()
        coordinator.profile.onEvent = profile.makeEventHandler()

        coordinator.onEvent = { event in
            switch event {
            case .selectedTab(let tab, let isAtRoot),
                 .reselectedTab(let tab, let isAtRoot):
                analytics.track("tab.\(tab.rawValue)")
                // Повторный тап по активному табу тоже считается возвратом:
                // на вложенных экранах Главной таб-бар скрыт, поэтому тапнуть
                // по нему можно только находясь на корне.
                if isAtRoot {
                    analytics.track(tab.rootScreenEvent)
                }
            case .presentedSheet(let sheet):
                analytics.track("modal.global.\(sheet.analyticsName)")
            case .presentedCover(let cover):
                analytics.track("modal.global.\(cover.analyticsName)")
            }
        }

        // Стартовый таб выставлен по умолчанию и `didSet` не вызывает,
        // поэтому первое открытие фиксируем явно.
        analytics.track("tab.\(coordinator.selectedTab.rawValue)")
        analytics.track(coordinator.selectedTab.rootScreenEvent)
    }
}
