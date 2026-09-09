//
//  HomeTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HomeTab: View {
    @ObservedObject var coordinator: NavigationCoordinator<HomeRoute>
    let router: HomeRouter
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            router.rootView()
                .navigationDestination(for: HomeRoute.self) { route in
                    router.view(for: route)
                }
                .sheet(item: $coordinator.localSheet) { sheet in
                    LocalModalRouter.view(for: sheet)
                }
                .fullScreenCover(item: $coordinator.localCover) { cover in
                    LocalModalRouter.view(for: cover)
                }
        }
        .tint(Color(red: 128 / 255, green: 108 / 255, blue: 187 / 255))
    }
}

#Preview {
    let coordinator = NavigationCoordinator<HomeRoute>()
    HomeTab(coordinator: coordinator,
            router: HomeRouter(dependencies: AppContainer.preview, coordinator: coordinator))
}
