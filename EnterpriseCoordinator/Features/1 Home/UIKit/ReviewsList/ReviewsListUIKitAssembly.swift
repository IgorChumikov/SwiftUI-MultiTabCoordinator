//
//  ReviewsListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReviewsListUIKitAssembly: UIViewControllerRepresentable {
    let coordinator: NavigationCoordinator<HomeRoute>

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = ReviewsListViewController()
        viewController.coordinator = coordinator
        viewController.items = HomeMockData.reviews
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
