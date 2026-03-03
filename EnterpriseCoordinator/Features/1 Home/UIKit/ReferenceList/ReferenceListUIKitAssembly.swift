//
//  ReferenceListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReferenceListUIKitAssembly: UIViewControllerRepresentable {
    let coordinator: NavigationCoordinator<HomeRoute>

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = ReferenceListViewController()
        viewController.coordinator = coordinator
        viewController.items = HomeMockData.reference
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
