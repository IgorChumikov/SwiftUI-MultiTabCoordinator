//
//  ReferenceDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReferenceDetailUIKitAssembly: UIViewControllerRepresentable {
    let coordinator: NavigationCoordinator<HomeRoute>
    let documentID: String

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = ReferenceDetailViewController()
        viewController.coordinator = coordinator
        viewController.documentID = documentID
        viewController.documents = HomeMockData.reference
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
