//
//  ProfileRoute.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum ProfileRoute: Route {
    case settings
    case orderHistory
    case orderDetail(id: String)
    
    var id: String {
        switch self {
        case .settings: "settings"
        case .orderHistory: "history"
        case .orderDetail(let id): "order-\(id)"
        }
    }
}
