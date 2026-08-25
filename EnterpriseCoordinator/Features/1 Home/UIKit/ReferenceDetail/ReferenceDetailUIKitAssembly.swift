//
//  ReferenceDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReferenceDetailUIKitAssembly: View {
    let coordinator: NavigationCoordinator<HomeRoute>
    let documentID: String
    let documentService: DocumentServicing

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                ReferenceDetailViewController()
            },
            updateViewController: { viewController in
                viewController.coordinator = coordinator
                viewController.documentService = documentService
                viewController.documentID = documentID
                viewController.documents = HomeMockData.reference
            }
        )
    }
}
