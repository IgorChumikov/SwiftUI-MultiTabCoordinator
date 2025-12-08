//
//  GlobalCover.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

enum LocalCover: Identifiable {
    case login
    case quickView(productId: String)
    
    var id: String {
        switch self {
        case .login: return "login"
        case .quickView(let id): return "quick-\(id)"
        }
    }
}

extension TabBarCoordinator {
    @ViewBuilder
    func buildModal(_ modal: LocalCover) -> some View {
        switch modal {
        case .login:
            LoginView()
        case .quickView(let id):
            QuickView(productId: id)
        }
    }
    
}
