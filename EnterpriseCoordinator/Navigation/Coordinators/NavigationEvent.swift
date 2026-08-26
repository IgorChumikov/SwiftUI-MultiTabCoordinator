//
//  NavigationEvent.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation

/// Событие внутри одного таба. Испускается координатором в момент,
/// когда навигация действительно произошла, — в отличие от `.onAppear`,
/// который привязан к жизненному циклу вью и срабатывает ещё и на возврате
/// по стеку.
enum NavigationEvent<RouteType: Route> {
    case pushed(RouteType)
    case popped
    case poppedToRoot
    case presentedSheet(LocalSheet)
    case presentedCover(LocalCover)
}

/// Событие уровня приложения.
enum TabBarEvent {
    case selectedTab(AppTab)
    case presentedSheet(GlobalSheet)
    case presentedCover(GlobalCover)
}
