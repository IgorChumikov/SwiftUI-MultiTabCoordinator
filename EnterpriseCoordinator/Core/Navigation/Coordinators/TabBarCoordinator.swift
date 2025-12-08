//
//  TabBarCoordinator.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

final class TabBarCoordinator: ObservableObject {
    @Published var selectedTab: AppTab = .home
    
    // Координаторы для каждой вкладки
    let home = NavigationCoordinator<HomeRoute>()
    let catalog = NavigationCoordinator<CatalogRoute>()
    let cart = NavigationCoordinator<CartRoute>()
    let profile = NavigationCoordinator<ProfileRoute>()
    
    // Глобальные модалки
    @Published var globalModal: AppSheetScreen?
    @Published var globalFullScreenCover: AppFullScreenCover?
    
    // MARK: - Межтабовая навигация
    
    func showProduct(id: String) {
        selectedTab = .home
        home.popToRoot()
        home.push(.productDetail(id: id))
    }
    
    func showCart() {
        selectedTab = .cart
    }
    
    func showGlobalModal(_ modal: AppSheetScreen) {
        globalModal = modal
    }
    
    func showGlobalFullScreenCover(_ cover: AppFullScreenCover) {
          globalFullScreenCover = cover
      }
}
