//
//  HistoryTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HistoryTab: View {
    @ObservedObject var coordinator: NavigationCoordinator<HistoryRoute>
    let router: HistoryRouter
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            router.rootView()
                .navigationDestination(for: HistoryRoute.self) { route in
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
    let coordinator = NavigationCoordinator<HistoryRoute>()
    HistoryTab(coordinator: coordinator,
               router: HistoryRouter(dependencies: AppContainer.preview, coordinator: coordinator))
}
