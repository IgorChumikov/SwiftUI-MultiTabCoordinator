//
//  AppTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

// MARK: - Tabs
enum AppTab: String, CaseIterable, Identifiable {
    case home, catalog, cart, profile
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .home: "Главная"
        case .catalog: "Каталог"
        case .cart: "Корзина"
        case .profile: "Профиль"
        }
    }
    
    var icon: String {
        switch self {
        case .home: "house.fill"
        case .catalog: "square.grid.2x2.fill"
        case .cart: "cart.fill"
        case .profile: "person.fill"
        }
    }
}
