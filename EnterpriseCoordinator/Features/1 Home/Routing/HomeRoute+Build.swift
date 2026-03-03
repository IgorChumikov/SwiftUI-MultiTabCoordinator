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
        switch route {
        case .newsList:
            NewsListUIKitAssembly(coordinator: self)
                .toolbar(.hidden, for: .tabBar)
        case .newsDetail(let id):
            NewsDetailUIKitAssembly(coordinator: self, newsID: id)
                .toolbar(.hidden, for: .tabBar)
        case .codesList:
            CodesListUIKitAssembly(coordinator: self)
                .toolbar(.hidden, for: .tabBar)
        case .codeDetail(let id):
            CodeDetailUIKitAssembly(coordinator: self, documentID: id)
                .toolbar(.hidden, for: .tabBar)
        case .referenceList:
            ReferenceListUIKitAssembly(coordinator: self)
                .toolbar(.hidden, for: .tabBar)
        case .referenceDetail(let id):
            ReferenceDetailUIKitAssembly(coordinator: self, documentID: id)
                .toolbar(.hidden, for: .tabBar)
        case .reviewsList:
            ReviewsListUIKitAssembly(coordinator: self)
                .toolbar(.hidden, for: .tabBar)
        case .reviewDetail(let id):
            ReviewDetailUIKitAssembly(coordinator: self, documentID: id)
                .toolbar(.hidden, for: .tabBar)
        }
    }
}
