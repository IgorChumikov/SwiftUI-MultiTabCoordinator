//
//  AppComposition.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import SwiftUI
import Combine

/// Composition root **одной сцены**: здесь собирается граф навигации.
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
    }
}
