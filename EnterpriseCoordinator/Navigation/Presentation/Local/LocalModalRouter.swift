//
//  LocalModalRouter.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import SwiftUI

/// Общий для всех табов: типы `LocalSheet`/`LocalCover` тоже общие.
/// Остался статическим — этим экранам сервисы пока не нужны,
/// а хранить неиспользуемые зависимости смысла нет.
enum LocalModalRouter {
    @ViewBuilder
    static func view(for sheet: LocalSheet) -> some View {
        switch sheet {
        case .camera:
            CameraView()
        case .videoPlayer(let url):
            VideoPlayerView(url: url)
        }
    }

    @ViewBuilder
    static func view(for cover: LocalCover) -> some View {
        switch cover {
        case .quickView(let id):
            QuickView(productId: id)
        }
    }
}
