//
//  FavoritesRoute+ViewBuilder..swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

extension NavigationCoordinator where RouteType == FavoritesRoute {
    @ViewBuilder
    func build(_ route: FavoritesRoute) -> some View {
        switch route {
        case .category(_, let name):
            CategoryView(name: name)
        case .productDetail(let id):
            ProductDetailView(id: id)
        case .filters:
            FiltersView()
        }
    }
}
