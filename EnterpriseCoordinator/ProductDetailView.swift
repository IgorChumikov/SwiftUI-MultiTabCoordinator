//
//  ProductDetailView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

// MARK: - Detail Views
struct ProductDetailView: View {
    let id: String
    @EnvironmentObject var app: AppCoordinator
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Товар #\(id)")
                .font(.title)
            Button("Назад") { app.home.pop() }
            Button("В корзину →") { app.showCart() }
        }
        .navigationTitle("Товар \(id)")
    }
}

struct PromotionsView: View { var body: some View { Text("Акции").navigationTitle("Акции") } }
struct SearchView: View { let query: String; var body: some View { Text("Поиск: \(query)").navigationTitle("Поиск") } }
struct CategoryView: View { let name: String; var body: some View { Text("Категория: \(name)").navigationTitle(name) } }
struct FiltersView: View { var body: some View { Text("Фильтры").navigationTitle("Фильтры") } }
struct CheckoutView: View { var body: some View { Text("Оформление").navigationTitle("Оформление") } }
struct OrderConfirmedView: View { let id: String; var body: some View { Text("Заказ \(id) подтверждён!").navigationTitle("Успех") } }
struct SettingsView: View { var body: some View { Text("Настройки").navigationTitle("Настройки") } }
struct OrderHistoryView: View {
    @EnvironmentObject var app: AppCoordinator
    var body: some View {
        List(1...10, id: \.self) { i in
            Button("Заказ #\(i)") { app.profile.push(.orderDetail(id: "\(i)")) }
        }
        .navigationTitle("История")
    }
}
struct OrderDetailView: View { let id: String; var body: some View { Text("Заказ #\(id)").navigationTitle("Заказ") } }

// MARK: - Modals
struct LoginView: View {
    @Environment(\.dismiss) var dismiss
    var body: some View {
        NavigationStack {
            VStack {
                Text("Вход")
                Button("Закрыть") { dismiss() }
            }
            .navigationTitle("Логин")
        }
    }
}

struct QuickView: View {
    let productId: String
    @Environment(\.dismiss) var dismiss
    var body: some View {
        VStack {
            Text("Quick View")
            Text("Товар: \(productId)")
            Button("Закрыть") { dismiss() }
        }
    }
}
