//
//  NewsListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct NewsListUIKitAssembly: UIViewControllerRepresentable {
    let coordinator: NavigationCoordinator<HomeRoute>

    func makeUIViewController(context: Context) -> UIViewController {
        let viewController = NewsListViewController()
        viewController.coordinator = coordinator
        viewController.items = HomeMockData.newsArticles
        return viewController
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}
