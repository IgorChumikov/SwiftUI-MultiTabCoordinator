//
//  GlobalCover.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

enum GlobalCover: Identifiable {
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
    func buildGlobalCover(_ modal: GlobalCover) -> some View {
        switch modal {
        case .login:
            LoginView()
        case .quickView(let id):
            QuickView(productId: id)
        }
    }
    
}
