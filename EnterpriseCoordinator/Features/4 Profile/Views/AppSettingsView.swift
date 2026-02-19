//
//  AppSettingsView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct AppSettingsView: View {
    var body: some View {
        List {
            Section("Общие") {
                Text("Язык интерфейса: Русский")
                Text("Тема: Системная")
                Text("Уведомления: Включены")
            }

            Section("Версия") {
                Text("Версия приложения: 1.0.0")
                Text("Сборка: 100")
            }
        }
        .navigationTitle("Настройки приложения")
    }
}

#Preview {
    AppSettingsView()
}
