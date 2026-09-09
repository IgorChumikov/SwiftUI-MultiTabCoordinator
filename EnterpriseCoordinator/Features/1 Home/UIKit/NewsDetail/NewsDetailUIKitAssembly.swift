//
//  NewsDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct NewsDetailUIKitAssembly: View {
    let navigator: HomeNavigating
    let newsID: String
    let documentService: DocumentServicing

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                NewsDetailViewController(navigator: navigator,
                                         documentService: documentService,
                                         newsID: newsID)
            }
        )
    }
}
