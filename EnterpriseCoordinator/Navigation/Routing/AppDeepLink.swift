//
//  AppDeepLink.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 08.04.2026.
//

import Foundation

enum AppDeepLink {
    case profile(ProfileRoute)

    init?(url: URL) {
        guard let scheme = url.scheme?.lowercased(), scheme == "enterprise" else {
            return nil
        }

        let host = url.host?.lowercased()
        let pathComponents = url.pathComponents
            .filter { $0 != "/" }
            .map { $0.lowercased() }

        switch (host, pathComponents) {
        case ("about", _):
            self = .profile(.aboutApp)

        case ("profile", ["about"]):
            self = .profile(.aboutApp)

        case ("profile", ["settings"]):
            self = .profile(.settings)

        default:
            return nil
        }
    }
}
