//
//  GlobalSheet.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

enum GlobalSheet: Identifiable {
    case onboarding
    case camera
    case videoPlayer(url: String)
    
    var id: String {
        switch self {
        case .onboarding: return "onboarding"
        case .camera: return "camera"
        case .videoPlayer: return "video"
        }
    }
}

extension TabBarCoordinator {
    @ViewBuilder
    func buildFullScreenCover(_ cover: GlobalSheet) -> some View {
        switch cover {
        case .onboarding:
            OnboardingView()
        case .camera:
            CameraView()
        case .videoPlayer(let url):
            VideoPlayerView(url: url)
        }
    }
}
