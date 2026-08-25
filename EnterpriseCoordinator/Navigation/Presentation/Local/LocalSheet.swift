//
//  LocalSheet.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum LocalSheet: Identifiable {
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
