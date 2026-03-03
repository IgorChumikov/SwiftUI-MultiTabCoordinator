//
//  NewsDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct NewsDetailUIKitAssembly: UIViewControllerRepresentable {
    let coordinator: NavigationCoordinator<HomeRoute>
    let newsID: String

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = NewsDetailViewController()
        viewController.coordinator = coordinator
        viewController.newsID = newsID
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
