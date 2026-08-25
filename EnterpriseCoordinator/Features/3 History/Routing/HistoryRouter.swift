//
//  HistoryRouter.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HistoryRouter: Router {
    let dependencies: HistoryDependencies
    let coordinator: NavigationCoordinator<HistoryRoute>

    @ViewBuilder
    func rootView() -> some View {
        HistoryView(coordinator: coordinator)
            .onAppear { dependencies.analytics.track("history.root") }
    }

    @ViewBuilder
    func view(for route: HistoryRoute) -> some View {
        switch route {
        case .documentDetails(document: let document):
            DocumentHistoryDetailsView(coordinator: coordinator, document: document)
                .onAppear { dependencies.analytics.track("history.documentDetails") }
        case .allDocumentsHistoryView(documentTitle: let documentTitle):
            AllDocumentsHistoryView(coordinator: coordinator, documentTitle: documentTitle)
                .onAppear { dependencies.analytics.track("history.allDocuments") }
        }
    }
}
