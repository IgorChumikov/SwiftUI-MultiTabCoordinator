//
//  ReferenceListUIKitAssembly.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI

struct ReferenceListUIKitAssembly: View {
    let navigator: HomeNavigating

    var body: some View {
        UIKitViewControllerContainer(
            makeViewController: {
                ReferenceListViewController(navigator: navigator, items: HomeMockData.reference)
            }
        )
    }
}
