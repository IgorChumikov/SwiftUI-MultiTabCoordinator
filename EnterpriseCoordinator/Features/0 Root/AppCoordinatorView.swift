//
//  AppCoordinatorView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct AppCoordinatorView: View {
    @StateObject private var coordinator = TabBarCoordinator()
    
    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            HomeTab(coordinator: coordinator.home)
                .tabItem {
                    Label(AppTab.home.title, systemImage: AppTab.home.icon)
                }
                .tag(AppTab.home)
            
            FavoritesTab(coordinator: coordinator.favorites)
                .tabItem {
                    Label(AppTab.favorites.title, systemImage: AppTab.favorites.icon)
                }
                .tag(AppTab.favorites)
            
            HistoryTab(coordinator: coordinator.history)
                .tabItem {
                    Label(AppTab.history.title, systemImage: AppTab.history.icon)
                }
                .tag(AppTab.history)
            
            ProfileTab(coordinator: coordinator.profile)
                .tabItem {
                    Label(AppTab.profile.title, systemImage: AppTab.profile.icon)
                }
                .tag(AppTab.profile)
        }
        .environmentObject(coordinator)
        .sheet(item: $coordinator.globalSheet) { sheet in
            coordinator.buildGlobalSheet(sheet)
        }
        .fullScreenCover(item: $coordinator.globalCover) { cover in
            coordinator.buildGlobalCover(cover)
        }
    }
}

#Preview {
    AppCoordinatorView()
}
