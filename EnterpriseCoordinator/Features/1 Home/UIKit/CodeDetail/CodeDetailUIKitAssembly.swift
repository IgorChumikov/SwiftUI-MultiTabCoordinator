//
//  CodeDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct CodeDetailUIKitAssembly: UIViewControllerRepresentable {
    let coordinator: NavigationCoordinator<HomeRoute>
    let documentID: String

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = CodeDetailViewController()
        viewController.coordinator = coordinator
        viewController.documentID = documentID
        viewController.documents = HomeMockData.codes
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
