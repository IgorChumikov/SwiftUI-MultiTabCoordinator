//
//  CodeDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct CodeDetailUIKitAssembly: View {
    let coordinator: NavigationCoordinator<HomeRoute>
    let documentID: String

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                CodeDetailViewController()
            },
            updateViewController: { viewController in
                viewController.coordinator = coordinator
                viewController.documentID = documentID
                viewController.documents = HomeMockData.codes
            }
        )
    }
}
