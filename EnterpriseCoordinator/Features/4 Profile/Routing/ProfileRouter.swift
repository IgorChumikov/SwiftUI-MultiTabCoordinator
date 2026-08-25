//
//  ProfileRouter.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct ProfileRouter: Router {
    let dependencies: ProfileDependencies
    let coordinator: NavigationCoordinator<ProfileRoute>

    @ViewBuilder
    func rootView() -> some View {
        ProfileView(coordinator: coordinator, authService: dependencies.authService)
            .onAppear { dependencies.analytics.track("profile.root") }
    }

    @ViewBuilder
    func view(for route: ProfileRoute) -> some View {
        switch route {
        case .news:
            NewsListView(coordinator: coordinator)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("profile.newsList") }

        case .newsDetails(let id):
            NewsDetailsView(newsId: id, documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("profile.newsDetails") }

        case .codes:
            CodesListView(coordinator: coordinator)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("profile.codesList") }

        case .codeDocument(let id):
            CodeDocumentView(codeId: id, documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("profile.codeDocument") }

        case .settings:
            AppSettingsView()
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("profile.settings") }

        case .aboutApp:
            AboutAppView()
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("profile.about") }
        }
    }
}
