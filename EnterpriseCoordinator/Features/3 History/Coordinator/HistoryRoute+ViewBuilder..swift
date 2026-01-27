//
//  HistoryRoute+ViewBuilder..swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

extension NavigationCoordinator where RouteType == HistoryRoute {
    @ViewBuilder
    func build(_ route: HistoryRoute) -> some View {
        switch route {
        case .documentDetails(document: let document):
            DocumentHistoryDetailsView( coordinator: self, document: document)
        case .allDocumentsHistoryView(documentTitle: let documentTitle):
            AllDocumentsHistoryView(coordinator: self, documentTitle: documentTitle)
        }
    }
}
