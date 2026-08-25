//
//  ProfileView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct ProfileView: View {
    @ObservedObject var coordinator: NavigationCoordinator<ProfileRoute>
    let authService: AuthServicing
    
    var body: some View {
        List {
            Section("Аккаунт") {
                Text(authService.isAuthorized ? "Вы вошли в аккаунт" : "Вы не авторизованы")
                    .foregroundStyle(.secondary)
            }

            Section("Разделы") {
                Button("Новости") { coordinator.push(.news) }
                Button("Кодексы") { coordinator.push(.codes) }
                Button("Настройки приложения") { coordinator.push(.settings) }
                Button("О программе") { coordinator.push(.aboutApp) }
            }
        }
        .navigationTitle("Профиль")
    }
}

#Preview {
    ProfileView(coordinator: NavigationCoordinator<ProfileRoute>(),
                authService: StubAuthService())
}
