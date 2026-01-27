//
//  TabBarCoordinator.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

// MARK: - TabBarCoordinator

final class TabBarCoordinator: ObservableObject {
    
    // MARK: - Properties
    
    @Published var selectedTab: AppTab = .home
    
    // MARK: - Tab Coordinators
    
    let home = NavigationCoordinator<HomeRoute>()
    let catalog = NavigationCoordinator<CatalogRoute>()
    let history = NavigationCoordinator<HistoryRoute>()
    let profile = NavigationCoordinator<ProfileRoute>()
    
    // MARK: - Global Presentation
    
    @Published var globalSheet: GlobalSheet?
    @Published var globalCover: GlobalCover?
    
    // MARK: - Cross-Tab Navigation
    
    func showProduct(id: String) {
        selectedTab = .home
        home.popToRoot()
        home.push(.productDetail(id: id))
    }
    
    func showCart() {
        selectedTab = .history
    }
    
    // MARK: - Sheet Presentation
    
    func showGlobalSheet(_ sheet: GlobalSheet) {
        globalSheet = sheet
    }
    
    func dismissGlobalSheet() {
        globalSheet = nil
    }
    
    // MARK: - Full Screen Cover Presentation
    
    func showGlobalCover(_ cover: GlobalCover) {
        globalCover = cover
    }
    
    func dismissGlobalCover() {
        globalCover = nil
    }
}
