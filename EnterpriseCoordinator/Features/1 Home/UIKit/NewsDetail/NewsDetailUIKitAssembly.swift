//
//  NewsDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct NewsDetailUIKitAssembly: View {
    let coordinator: NavigationCoordinator<HomeRoute>
    let newsID: String
    let documentService: DocumentServicing

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                NewsDetailViewController()
            },
            updateViewController: { viewController in
                viewController.coordinator = coordinator
                viewController.documentService = documentService
                viewController.newsID = newsID
            }
        )
    }
}
