//
//  HomeTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

// MARK: - Tab Contents (чистые, без дублирования!)
struct HomeTab: View {
    @EnvironmentObject var app: AppCoordinator
    var coordinator: TabCoordinator<HomeRoute> { app.home }
    
    var body: some View {
        NavigationStack(path: $app.home.path) {
            HomeView()
                .navigationDestination(for: HomeRoute.self) { app.home.build($0) }
                .sheet(item: $app.home.sheet) { app.buildModal($0) }
        }
    }
}

struct CatalogTab: View {
    @EnvironmentObject var app: AppCoordinator
    var coordinator: TabCoordinator<CatalogRoute> { app.catalog }
    
    var body: some View {
        NavigationStack(path: $app.catalog.path) {
            CatalogView()
                .navigationDestination(for: CatalogRoute.self) { app.catalog.build($0) }
                .sheet(item: $app.catalog.sheet) { app.buildModal($0) }
        }
    }
}

struct CartTab: View {
    @EnvironmentObject var app: AppCoordinator
    var coordinator: TabCoordinator<CartRoute> { app.cart }
    
    var body: some View {
        NavigationStack(path: $app.cart.path) {
            CartView()
                .navigationDestination(for: CartRoute.self) { app.cart.build($0) }
        }
    }
}

struct ProfileTab: View {
    @EnvironmentObject var app: AppCoordinator
    var coordinator: TabCoordinator<ProfileRoute> { app.profile }
    
    var body: some View {
        NavigationStack(path: $app.profile.path) {
            ProfileView()
                .navigationDestination(for: ProfileRoute.self) { app.profile.build($0) }
        }
    }
}

// MARK: - Screens
struct HomeView: View {
    @EnvironmentObject var app: AppCoordinator
    var c: TabCoordinator<HomeRoute> { app.home }
    
    var body: some View {
        List {
            Button("Товар 123") { c.push(.productDetail(id: "123")) }
            Button("Акции") { c.push(.promotions) }
            Button("Поиск iPhone") { c.push(.search(query: "iPhone")) }
            Button("Quick View 456") { c.presentSheet(.quickView(productId: "456")) }
            Button("Глобальный логин") { app.showGlobalModal(.login) }
            Button("Перейти в корзину") { app.showCart() }
            Button("Deep link → Товар 999") { app.showProduct(id: "999") }
        }
        .navigationTitle("Главная")
    }
}

struct CatalogView: View {
    @EnvironmentObject var app: AppCoordinator
    var c: TabCoordinator<CatalogRoute> { app.catalog }
    
    var body: some View {
        List {
            Button("Смартфоны") { c.push(.category(id: "1", name: "Смартфоны")) }
            Button("Товар 789") { c.push(.productDetail(id: "789")) }
            Button("Фильтры") { c.push(.filters) }
        }
        .navigationTitle("Каталог")
    }
}

struct CartView: View {
    @EnvironmentObject var app: AppCoordinator
    var c: TabCoordinator<CartRoute> { app.cart }
    
    var body: some View {
        List {
            Button("Оформить заказ") { c.push(.checkout) }
        }
        .navigationTitle("Корзина")
    }
}

struct ProfileView: View {
    @EnvironmentObject var app: AppCoordinator
    var c: TabCoordinator<ProfileRoute> { app.profile }
    
    var body: some View {
        List {
            Button("Настройки") { c.push(.settings) }
            Button("История заказов") { c.push(.orderHistory) }
        }
        .navigationTitle("Профиль")
    }
}
