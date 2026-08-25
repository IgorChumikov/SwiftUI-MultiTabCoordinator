//
//  GlobalModalRouter.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import SwiftUI

enum GlobalModalRouter {
    @ViewBuilder
    static func view(for sheet: GlobalSheet) -> some View {
        switch sheet {
        case .onboarding:
            OnboardingView()
        case .camera:
            CameraView()
        case .videoPlayer(let url):
            VideoPlayerView(url: url)
        }
    }

    @ViewBuilder
    static func view(for cover: GlobalCover) -> some View {
        switch cover {
        case .login:
            LoginView()
        case .quickView(let id):
            QuickView(productId: id)
        }
    }
}
