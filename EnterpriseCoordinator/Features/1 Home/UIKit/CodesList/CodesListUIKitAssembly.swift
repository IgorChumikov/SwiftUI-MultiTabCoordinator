//
//  CodesListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct CodesListUIKitAssembly: UIViewControllerRepresentable {
    let coordinator: NavigationCoordinator<HomeRoute>

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = CodesListViewController()
        viewController.coordinator = coordinator
        viewController.items = HomeMockData.codes
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
