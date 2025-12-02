//
//  CartView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var app: AppCoordinator
    @ObservedObject var coordinator: TabCoordinator<CartRoute>
    
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
        .navigationTitle("🛒 Корзина")
    }
}
