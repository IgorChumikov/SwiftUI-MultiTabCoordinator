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
        HomeView(coordinator: coordinator)
            .onAppear { dependencies.analytics.track("home.root") }
    }

    @ViewBuilder
    func view(for route: HomeRoute) -> some View {
        switch route {
        case .newsList:
            NewsListUIKitAssembly(coordinator: coordinator)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("home.newsList") }
        case .newsDetail(let id):
            NewsDetailUIKitAssembly(coordinator: coordinator,
                                    newsID: id,
                                    documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("home.newsDetail") }
        case .codesList:
            CodesListUIKitAssembly(coordinator: coordinator)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("home.codesList") }
        case .codeDetail(let id):
            CodeDetailUIKitAssembly(coordinator: coordinator,
                                    documentID: id,
                                    documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("home.codeDetail") }
        case .referenceList:
            ReferenceListUIKitAssembly(coordinator: coordinator)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("home.referenceList") }
        case .referenceDetail(let id):
            ReferenceDetailUIKitAssembly(coordinator: coordinator,
                                         documentID: id,
                                         documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("home.referenceDetail") }
        case .reviewsList:
            ReviewsListUIKitAssembly(coordinator: coordinator)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("home.reviewsList") }
        case .reviewDetail(let id):
            ReviewDetailUIKitAssembly(coordinator: coordinator,
                                      documentID: id,
                                      documentService: dependencies.documentService)
                .toolbar(.hidden, for: .tabBar)
                .onAppear { dependencies.analytics.track("home.reviewDetail") }
        }
    }
}
