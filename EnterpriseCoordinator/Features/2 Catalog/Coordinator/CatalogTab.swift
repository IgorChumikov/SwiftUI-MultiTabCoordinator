//
//  CatalogTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct CatalogTab: View {
    @EnvironmentObject var app: TabBarCoordinator
    @ObservedObject var coordinator: NavigationCoordinator<CatalogRoute>
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            CatalogView(coordinator: coordinator)
                .navigationDestination(for: CatalogRoute.self) { route in
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
