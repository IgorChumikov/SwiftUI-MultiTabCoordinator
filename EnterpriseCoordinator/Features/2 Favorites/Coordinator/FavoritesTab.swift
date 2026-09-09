//
//  FavoritesTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct FavoritesTab: View {
    @ObservedObject var coordinator: NavigationCoordinator<FavoritesRoute>
    let router: FavoritesRouter
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            router.rootView()
                .navigationDestination(for: FavoritesRoute.self) { route in
                    router.view(for: route)
                }
                .sheet(item: $coordinator.localSheet) { sheet in
                    LocalModalRouter.view(for: sheet)
                }
                .fullScreenCover(item: $coordinator.localCover) { cover in
                    LocalModalRouter.view(for: cover)
                }
        }
    }
}

#Preview {
    let coordinator = NavigationCoordinator<FavoritesRoute>()
    FavoritesTab(coordinator: coordinator,
                 router: FavoritesRouter(dependencies: AppContainer.preview, coordinator: coordinator))
}
