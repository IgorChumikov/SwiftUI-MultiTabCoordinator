//
//  HomeRoute.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum HomeRoute: Route {
    case productDetail(id: String)
    case promotions
    case search(query: String)
    
    var id: String {
        switch self {
        case .productDetail(let id): "product-\(id)"
        case .promotions: "promotions"
        case .search(let q): "search-\(q)"
        }
    }
}
