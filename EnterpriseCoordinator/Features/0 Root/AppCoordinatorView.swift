//
//  AppCoordinatorView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct AppCoordinatorView: View {

    /// Граф собран в точке входа приложения, вью его только использует.
    let composition: AppComposition

    var body: some View {
        AppTabsView(composition: composition, coordinator: composition.coordinator)
    }
}

// MARK: - Tabs

/// Отдельная вью нужна, чтобы подписаться на `TabBarCoordinator` через
/// `@ObservedObject` и получить биндинги (`$coordinator.selectedTab` и т.д.).
private struct AppTabsView: View {
    let composition: AppComposition
    @ObservedObject var coordinator: TabBarCoordinator

    var body: some View {
        TabView(selection: $coordinator.selectedTab) {
            HomeTab(coordinator: coordinator.home, router: composition.home)
                .tabItem {
                    Label(AppTab.home.title, systemImage: AppTab.home.icon)
                }
                .tag(AppTab.home)

            FavoritesTab(coordinator: coordinator.favorites, router: composition.favorites)
                .tabItem {
                    Label(AppTab.favorites.title, systemImage: AppTab.favorites.icon)
                }
                .tag(AppTab.favorites)

            HistoryTab(coordinator: coordinator.history, router: composition.history)
                .tabItem {
                    Label(AppTab.history.title, systemImage: AppTab.history.icon)
                }
                .tag(AppTab.history)

            ProfileTab(coordinator: coordinator.profile, router: composition.profile)
                .tabItem {
                    Label(AppTab.profile.title, systemImage: AppTab.profile.icon)
                }
                .tag(AppTab.profile)
        }
        .tint(Color(red: 128 / 255, green: 108 / 255, blue: 187 / 255))
        .environmentObject(coordinator)
        .sheet(item: $coordinator.globalSheet) { sheet in
            composition.globalModal.view(for: sheet)
        }
        .fullScreenCover(item: $coordinator.globalCover) { cover in
            composition.globalModal.view(for: cover)
        }
        .onOpenURL { url in
            coordinator.handle(url)
        }
    }
}

#Preview {
    AppCoordinatorView(composition: AppComposition(container: .preview))
}
