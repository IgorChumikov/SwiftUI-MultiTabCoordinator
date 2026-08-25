//
//  GlobalSheet.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

/// Модалка уровня приложения. См. `GlobalCover`.
enum GlobalSheet: Identifiable {
    case onboarding
    
    var id: String {
        switch self {
        case .onboarding: return "onboarding"
        }
    }
}
