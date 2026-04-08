//
//  ReviewsListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReviewsListUIKitAssembly: View {
    let coordinator: NavigationCoordinator<HomeRoute>

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                ReviewsListViewController()
            },
            updateViewController: { viewController in
                viewController.coordinator = coordinator
                viewController.items = HomeMockData.reviews
            }
        )
    }
}
