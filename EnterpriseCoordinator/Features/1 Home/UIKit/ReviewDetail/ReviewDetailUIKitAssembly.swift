//
//  ReviewDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReviewDetailUIKitAssembly: View {
    let coordinator: NavigationCoordinator<HomeRoute>
    let documentID: String

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                ReviewDetailViewController()
            },
            updateViewController: { viewController in
                viewController.coordinator = coordinator
                viewController.documentID = documentID
                viewController.documents = HomeMockData.reviews
            }
        )
    }
}
