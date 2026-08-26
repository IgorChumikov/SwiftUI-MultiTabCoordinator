//
//  CodeDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct CodeDetailUIKitAssembly: View {
    let navigator: HomeNavigating
    let documentID: String
    let documentService: DocumentServicing

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                CodeDetailViewController(navigator: navigator,
                   documentService: documentService,
                   documentID: documentID,
                   documents: HomeMockData.codes)
            }
        )
    }
}
