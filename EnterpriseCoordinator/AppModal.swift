//
//  AppModal.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

// MARK: - Modals
enum AppModal: Identifiable {
    case login
    case quickView(productId: String)
    
    var id: String {
        switch self {
        case .login: "login"
        case .quickView(let id): "quick-\(id)"
        }
    }
}
