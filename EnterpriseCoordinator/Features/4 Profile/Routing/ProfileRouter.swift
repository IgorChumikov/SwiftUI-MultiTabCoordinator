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
    }

    @ViewBuilder
    func view(for route: ProfileRoute) -> some View {
        switch route {
        case .news:
            NewsListView(
                viewModel: NewsListViewModel(newsService: dependencies.newsService,
                                             documentService: dependencies.documentService,
                                             navigator: coordinator)
            )
            .toolbar(.hidden, for: .tabBar)

        case .newsDetails(let id):
            NewsDetailsView(
                viewModel: NewsDetailsViewModel(newsID: id,
                                                newsService: dependencies.newsService,
                                                documentService: dependencies.documentService)
            )
            .toolbar(.hidden, for: .tabBar)

        case .codes:
            CodesListView(
                viewModel: CodesListViewModel(documentService: dependencies.documentService,
                                              navigator: coordinator)
            )
            .toolbar(.hidden, for: .tabBar)

        case .codeDocument(let id):
            CodeDocumentView(
                viewModel: CodeDocumentViewModel(codeID: id,
                                                 documentService: dependencies.documentService)
            )
            .toolbar(.hidden, for: .tabBar)

        case .settings:
            AppSettingsView()
                .toolbar(.hidden, for: .tabBar)

        case .aboutApp:
            AboutAppView()
                .toolbar(.hidden, for: .tabBar)
        }
    }

    func makeEventHandler() -> (NavigationEvent<ProfileRoute>) -> Void {
        let analytics = dependencies.analytics
        return { event in
            switch event {
            case .pushed(let route):
                analytics.track("profile.\(route.analyticsName)")
            case .presentedSheet(let sheet):
                analytics.track("profile.modal.\(sheet.analyticsName)")
            case .presentedCover(let cover):
                analytics.track("profile.modal.\(cover.analyticsName)")
            case .popped(let remaining):
                // Возврат к корню таба — отдельное событие. Промежуточные
                // возвраты не считаем: экран уже был засчитан при переходе
                // вперёд.
                if remaining == 0 {
                    analytics.track(AppTab.profile.rootScreenEvent)
                }
            }
        }
    }
}
