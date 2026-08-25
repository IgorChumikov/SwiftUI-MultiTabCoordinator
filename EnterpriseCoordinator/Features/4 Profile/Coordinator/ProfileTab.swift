//
//  ProfileTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct ProfileTab: View {
    @ObservedObject var coordinator: NavigationCoordinator<ProfileRoute>
    let router: ProfileRouter
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            router.rootView()
                .navigationDestination(for: ProfileRoute.self) { route in
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
    let coordinator = NavigationCoordinator<ProfileRoute>()
    ProfileTab(coordinator: coordinator,
               router: ProfileRouter(dependencies: AppContainer.preview, coordinator: coordinator))
}
