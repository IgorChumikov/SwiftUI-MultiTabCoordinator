//
//  LocalSheet.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

/// Модалка, принадлежащая сценарию внутри таба. См. `LocalCover`.
enum LocalSheet: Identifiable {
    case camera
    case videoPlayer(url: String)
    
    var id: String {
        switch self {
        case .camera: return "camera"
        case .videoPlayer: return "video"
        }
    }
}
