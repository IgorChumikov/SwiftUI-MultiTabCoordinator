//
//  ProfileNavigating.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation

/// Намерения на экранах Профиля.
protocol ProfileNavigating: AnyObject {
    func openNewsDetails(id: String)
    func openCodeDocument(id: String)
}

extension NavigationCoordinator: ProfileNavigating where RouteType == ProfileRoute {
    func openNewsDetails(id: String) { push(.newsDetails(id: id)) }
    func openCodeDocument(id: String) { push(.codeDocument(id: id)) }
}
