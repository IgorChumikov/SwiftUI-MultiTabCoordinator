//
//  FavoritesTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct FavoritesTab: View {
    @EnvironmentObject var app: TabBarCoordinator
    @ObservedObject var coordinator: NavigationCoordinator<FavoritesRoute>
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            FavoritesView(coordinator: coordinator)
                .navigationDestination(for: FavoritesRoute.self) { route in
                    coordinator.build(route)
                }
                .sheet(item: $coordinator.localSheet) { sheet in
                    app.buildLocalSheet(sheet)
                }
                .fullScreenCover(item: $coordinator.localCover) { cover in
                    app.buildLocalCover(cover)
                }
        }
    }
}
