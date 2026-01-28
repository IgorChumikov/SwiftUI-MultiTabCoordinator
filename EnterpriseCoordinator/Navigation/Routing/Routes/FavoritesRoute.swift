//
//  FavoritesRoute.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum FavoritesRoute: Route {
    case bookmarks
    case folders
    case documentsUnderControl
    case uploadedDocuments
    
    var id: String {
        switch self {
        case .bookmarks: return "bookmarks"
        case .folders: return "folders"
        case .documentsUnderControl: return "documentsUnderControl"
        case .uploadedDocuments: return "uploadedDocuments"
        }
    }
}
