//
//  ReviewsListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReviewsListUIKitAssembly: View {
    let navigator: HomeNavigating

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                ReviewsListViewController(navigator: navigator, items: HomeMockData.reviews)
            }
        )
    }
}
