//
//  TabBarCoordinator.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

// Type aliases для удобства чтения
typealias HomeCoordinator = NavigationCoordinator<HomeRoute>
typealias CatalogCoordinator = NavigationCoordinator<CatalogRoute>
typealias CartCoordinator = NavigationCoordinator<CartRoute>
typealias ProfileCoordinator = NavigationCoordinator<ProfileRoute>

final class TabBarCoordinator: ObservableObject {
    @Published var selectedTab: AppTab = .home
    
    // Координаторы для каждой вкладки
    let home = HomeCoordinator()
    let catalog = CatalogCoordinator()
    let cart = CartCoordinator()
    let profile = ProfileCoordinator()
    
    // Глобальные модалки
    @Published var globalModal: GlobalCover?
    @Published var globalFullScreenCover: GlobalSheet?
    
    // MARK: - Межтабовая навигация
    
    func showProduct(id: String) {
        selectedTab = .home
        home.popToRoot()
        home.push(.productDetail(id: id))
    }
    
    func showCart() {
        selectedTab = .cart
    }
    
    func showGlobalModal(_ modal: GlobalCover) {
        globalModal = modal
    }
    
    func showGlobalFullScreenCover(_ cover: GlobalSheet) {
          globalFullScreenCover = cover
      }
}
