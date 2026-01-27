//
//  HistoryView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var app: TabBarCoordinator
    @ObservedObject var coordinator: NavigationCoordinator<HistoryRoute>
    
    var body: some View {
        List {
            Button("💳 Оформить заказ") {
                coordinator.push(.checkout)
            }
            
            Section("Отладка") {
                Text("Path count: \(coordinator.path.count)")
                    .foregroundStyle(.secondary)
            }
        }
        .navigationTitle("История")
    }
}
