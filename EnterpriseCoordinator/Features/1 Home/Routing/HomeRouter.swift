//
//  HomeRouter.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HomeRouter: Router {
    let dependencies: HomeDependencies
    let coordinator: NavigationCoordinator<HomeRoute>

    @ViewBuilder
    func rootView() -> some View {
        HomeView(navigator: coordinator)
    }

    @ViewBuilder
    func view(for route: HomeRoute) -> some View {
        switch route {
        case .newsList:
            NewsListUIKitAssembly(navigator: coordinator)
                .toolbar(.hidden, for: .tabBar)
        case .newsDetail(let id):
            NewsDetailUIKitAssembly(navigator: coordinator,
                                    newsID: id,
                                    documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
        case .codesList:
            CodesListUIKitAssembly(navigator: coordinator)
                .toolbar(.hidden, for: .tabBar)
        case .codeDetail(let id):
            CodeDetailUIKitAssembly(navigator: coordinator,
                                    documentID: id,
                                    documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
        case .referenceList:
            ReferenceListUIKitAssembly(navigator: coordinator)
                .toolbar(.hidden, for: .tabBar)
        case .referenceDetail(let id):
            ReferenceDetailUIKitAssembly(navigator: coordinator,
                                         documentID: id,
                                         documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
        case .reviewsList:
            ReviewsListUIKitAssembly(navigator: coordinator)
                .toolbar(.hidden, for: .tabBar)
        case .reviewDetail(let id):
            ReviewDetailUIKitAssembly(navigator: coordinator,
                                      documentID: id,
                                      documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
        }
    }

    func makeEventHandler() -> (NavigationEvent<HomeRoute>) -> Void {
        let analytics = dependencies.analytics
        return { event in
            switch event {
            case .pushed(let route):
                analytics.track("home.\(route.analyticsName)")
            case .presentedSheet(let sheet):
                analytics.track("home.modal.\(sheet.analyticsName)")
            case .presentedCover(let cover):
                analytics.track("home.modal.\(cover.analyticsName)")
            case .popped(let remaining):
                // Возврат к корню таба — отдельное событие. Промежуточные
                // возвраты не считаем: экран уже был засчитан при переходе
                // вперёд.
                if remaining == 0 {
                    analytics.track(AppTab.home.rootScreenEvent)
                }
            }
        }
    }
}
