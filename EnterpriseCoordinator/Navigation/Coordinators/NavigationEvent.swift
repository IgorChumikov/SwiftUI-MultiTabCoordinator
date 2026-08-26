//
//  NavigationEvent.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation

/// Событие внутри одного таба. Испускается координатором в момент,
/// когда навигация действительно произошла, — в отличие от `.onAppear`,
/// который привязан к жизненному циклу вью.
enum NavigationEvent<RouteType: Route> {
    case pushed(RouteType)
    /// Стек уменьшился. `remaining == 0` означает возврат к корню таба.
    /// Ловится в том числе для системной кнопки «назад» и свайпа.
    case popped(remaining: Int)
    case presentedSheet(LocalSheet)
    case presentedCover(LocalCover)
}

/// Событие уровня приложения.
enum TabBarEvent {
    /// Пользователь переключился на другой таб.
    case selectedTab(AppTab, isAtRoot: Bool)
    /// Пользователь тапнул по табу, в котором уже находится.
    case reselectedTab(AppTab, isAtRoot: Bool)
    case presentedSheet(GlobalSheet)
    case presentedCover(GlobalCover)
}
