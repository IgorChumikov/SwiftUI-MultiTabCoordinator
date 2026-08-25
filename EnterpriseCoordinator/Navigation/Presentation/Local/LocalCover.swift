//
//  LocalCover.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

/// Модалка, принадлежащая сценарию внутри таба: живёт вместе с этим табом
/// и показывается через его `NavigationCoordinator`.
enum LocalCover: Identifiable {
    case quickView(productId: String)
    
    var id: String {
        switch self {
        case .quickView(let id): return "quick-\(id)"
        }
    }
}
