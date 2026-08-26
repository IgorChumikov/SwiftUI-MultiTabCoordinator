//
//  ReviewDetailUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReviewDetailUIKitAssembly: View {
    let navigator: HomeNavigating
    let documentID: String
    let documentService: DocumentServicing

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                ReviewDetailViewController(navigator: navigator,
                   documentService: documentService,
                   documentID: documentID,
                   documents: HomeMockData.reviews)
            }
        )
    }
}
