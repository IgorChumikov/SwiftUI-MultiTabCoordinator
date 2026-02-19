//
//  ProfileRoute+ViewBuilder.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

extension NavigationCoordinator where RouteType == ProfileRoute {
    @ViewBuilder
    func build(_ route: ProfileRoute) -> some View {
        switch route {
        case .news:
            NewsListView(coordinator: self)
                .toolbar(.hidden, for: .tabBar)

        case .newsDetails(let id):
            NewsDetailsView(newsId: id)
                .toolbar(.hidden, for: .tabBar)

        case .codes:
            CodesListView(coordinator: self)
                .toolbar(.hidden, for: .tabBar)

        case .codeDocument(let id):
            CodeDocumentView(codeId: id)
                .toolbar(.hidden, for: .tabBar)

        case .settings:
            AppSettingsView()
                .toolbar(.hidden, for: .tabBar)

        case .aboutApp:
            AboutAppView()
                .toolbar(.hidden, for: .tabBar)
        }
    }
}
