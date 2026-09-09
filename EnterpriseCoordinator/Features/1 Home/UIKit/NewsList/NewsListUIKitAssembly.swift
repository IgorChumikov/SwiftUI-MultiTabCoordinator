//
//  NewsListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct NewsListUIKitAssembly: View {
    let navigator: HomeNavigating

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                NewsListViewController(navigator: navigator, items: HomeMockData.newsArticles)
            }
        )
    }
}
