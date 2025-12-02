//
//  AppCoordinatorView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

// MARK: - Main Coordinator View
struct AppCoordinatorView: View {
    @StateObject private var coordinator = AppCoordinator()
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            HomeTab()
                .tabItem { Label(AppTab.home.title, systemImage: AppTab.home.icon) }
                .tag(AppTab.home)
            
            CatalogTab()
                .tabItem { Label(AppTab.catalog.title, systemImage: AppTab.catalog.icon) }
                .tag(AppTab.catalog)
            
            CartTab()
                .tabItem { Label(AppTab.cart.title, systemImage: AppTab.cart.icon) }
                .tag(AppTab.cart)
            
            ProfileTab()
                .tabItem { Label(AppTab.profile.title, systemImage: AppTab.profile.icon) }
                .tag(AppTab.profile)
        }
        .environmentObject(coordinator)
        .sheet(item: $coordinator.globalModal) { coordinator.buildModal($0) }
    }
}
