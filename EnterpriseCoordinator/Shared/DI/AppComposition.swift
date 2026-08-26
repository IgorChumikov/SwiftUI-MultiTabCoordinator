//
//  AppComposition.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import SwiftUI

/// Composition root приложения: единственное место, где собирается граф объектов.
///
/// Создаётся один раз в `EnterpriseCoordinatorApp` — структура `App` живёт
/// столько же, сколько процесс, поэтому координаторы и роутеры не пересобираются
/// на рендерах. Наблюдаемым быть не должен: он ничего не публикует,
/// подписываться нужно на `TabBarCoordinator`.
final class AppComposition {

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
