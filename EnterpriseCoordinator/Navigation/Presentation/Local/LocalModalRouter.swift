//
//  LocalModalRouter.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import SwiftUI

/// Резолв local-модалок. Общий для всех табов, потому что сами типы
/// `LocalSheet`/`LocalCover` тоже общие, а не свои у каждой фичи.
enum LocalModalRouter {
    @ViewBuilder
    static func view(for sheet: LocalSheet) -> some View {
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
    static func view(for cover: LocalCover) -> some View {
        switch cover {
        case .login:
            LoginView()
        case .quickView(let id):
            QuickView(productId: id)
        }
    }
}
