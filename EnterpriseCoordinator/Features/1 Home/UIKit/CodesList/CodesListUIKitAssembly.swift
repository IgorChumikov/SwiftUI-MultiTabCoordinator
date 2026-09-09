//
//  CodesListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct CodesListUIKitAssembly: View {
    let navigator: HomeNavigating

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                CodesListViewController(navigator: navigator, items: HomeMockData.codes)
            }
        )
    }
}
