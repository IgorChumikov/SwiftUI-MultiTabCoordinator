//
//  AppCoordinator+ViewBuilders.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

extension AppCoordinator {
    @ViewBuilder func buildModal(_ modal: AppModal) -> some View {
        switch modal {
        case .login: LoginView()
        case .quickView(let id): QuickView(productId: id)
        }
    }
}


