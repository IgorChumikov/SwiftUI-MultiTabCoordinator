//
//  HomeRoute+ViewBuilder..swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

extension NavigationCoordinator where RouteType == HomeRoute {
    @ViewBuilder
    func build(_ route: HomeRoute) -> some View {
        let coordinator = HomeUIKitCoordinator(navigation: self)

        switch route {
        case .newsList:
            HomeUIKitViewControllerScreen {
                NewsListViewController(items: HomeMockData.newsArticles, coordinator: coordinator)
            }
            .toolbar(.hidden, for: .tabBar)

        case .newsDetail(let id):
            HomeUIKitViewControllerScreen {
                NewsDetailViewController(newsID: id, coordinator: coordinator)
            }
            .toolbar(.hidden, for: .tabBar)

        case .codesList:
            HomeUIKitViewControllerScreen {
                CodesListViewController(items: HomeMockData.codes, coordinator: coordinator)
            }
            .toolbar(.hidden, for: .tabBar)

        case .codeDetail(let id):
            HomeUIKitViewControllerScreen {
                CodesDetailViewController(documentID: id, title: "Документ", documents: HomeMockData.codes, coordinator: coordinator)
            }
            .toolbar(.hidden, for: .tabBar)

        case .referenceList:
            HomeUIKitViewControllerScreen {
                ReferenceListViewController(items: HomeMockData.reference, coordinator: coordinator)
            }
            .toolbar(.hidden, for: .tabBar)

        case .referenceDetail(let id):
            HomeUIKitViewControllerScreen {
                ReferenceDetailViewController(documentID: id, title: "Документ", documents: HomeMockData.reference, coordinator: coordinator)
            }
            .toolbar(.hidden, for: .tabBar)

        case .reviewsList:
            HomeUIKitViewControllerScreen {
                ReviewsListViewController(items: HomeMockData.reviews, coordinator: coordinator)
            }
            .toolbar(.hidden, for: .tabBar)

        case .reviewDetail(let id):
            HomeUIKitViewControllerScreen {
                ReviewsDetailViewController(documentID: id, title: "Документ", documents: HomeMockData.reviews, coordinator: coordinator)
            }
            .toolbar(.hidden, for: .tabBar)
        }
    }
}
