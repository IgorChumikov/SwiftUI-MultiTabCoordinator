//
//  CartRoute+ViewBuilder..swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

extension NavigationCoordinator where RouteType == CartRoute {
    @ViewBuilder
    func build(_ route: CartRoute) -> some View {
        switch route {
        case .checkout:
            CheckoutView()
        case .orderConfirmed(let id):
            OrderConfirmedView(id: id)
        }
    }
}
