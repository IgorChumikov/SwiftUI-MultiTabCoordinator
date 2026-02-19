//
//  ProfileRoute.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum ProfileRoute: Route {
    case news
    case newsDetails(id: String)
    case codes
    case codeDocument(id: String)
    case settings
    case aboutApp
    
    var id: String {
        switch self {
        case .news: return "news"
        case .newsDetails(let id): return "news-\(id)"
        case .codes: return "codes"
        case .codeDocument(let id): return "code-\(id)"
        case .settings: return "settings"
        case .aboutApp: return "about-app"
        }
    }
}
