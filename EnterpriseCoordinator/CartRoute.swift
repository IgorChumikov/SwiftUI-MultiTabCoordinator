//
//  CartRoute.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum CartRoute: Route {
    case checkout
    case orderConfirmed(id: String)
    
    var id: String {
        switch self {
        case .checkout: "checkout"
        case .orderConfirmed(let id): "confirmed-\(id)"
        }
    }
}
