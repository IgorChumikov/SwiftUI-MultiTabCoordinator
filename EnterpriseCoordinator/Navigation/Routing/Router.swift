//
//  Router.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import SwiftUI

/// Отвечает за сборку экранов фичи: корневого и всех, до которых ведут `Route`.
/// Состоянием навигации не владеет — им владеет `NavigationCoordinator`.
protocol Router {
    associatedtype RouteType: Route
    associatedtype RootContent: View
    associatedtype Content: View

    /// Корневой экран таба.
    @ViewBuilder
    func rootView() -> RootContent

    /// Экран, до которого ведёт конкретный маршрут.
    @ViewBuilder
    func view(for route: RouteType) -> Content

    /// Обработчик навигационных событий фичи: именование событий — забота фичи,
    /// а не координатора. Возвращает замыкание, чтобы оно захватывало только
    /// зависимости и не удерживало координатор (иначе — цикл ссылок).
    func makeEventHandler() -> (NavigationEvent<RouteType>) -> Void
}
