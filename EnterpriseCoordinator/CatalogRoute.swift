//
//  CatalogRoute.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum CatalogRoute: Route {
    case category(id: String, name: String)
    case productDetail(id: String)
    case filters
    
    var id: String {
        switch self {
        case .category(let id, _): "cat-\(id)"
        case .productDetail(let id): "product-\(id)"
        case .filters: "filters"
        }
    }
}
