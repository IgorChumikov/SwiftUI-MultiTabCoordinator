//
//  AboutAppView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct AboutAppView: View {
    var body: some View {
        List {
            Section("О программе") {
                Text("EnterpriseCoordinator")
                    .font(.headline)
                Text("Демонстрационное приложение для многоуровневой навигации в SwiftUI.")
            }

            Section("Контакты") {
                Text("support@example.com")
                Text("+7 (900) 000-00-00")
            }
        }
        .navigationTitle("О программе")
    }
}

#Preview {
    AboutAppView()
}
