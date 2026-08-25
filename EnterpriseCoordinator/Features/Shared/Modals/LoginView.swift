//
//  LoginView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct LoginView: View {
    let authService: AuthServicing
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                Text("🔐")
                    .font(.system(size: 80))

                Text(authService.isAuthorized ? "Вы уже вошли" : "Вход в аккаунт")
                    .font(.title)
                
                Button("Закрыть") {
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }
            .navigationTitle("Логин")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

#Preview {
    LoginView(authService: StubAuthService())
}
