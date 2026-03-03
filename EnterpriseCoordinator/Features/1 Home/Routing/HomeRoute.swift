//
//  HomeRoute.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum HomeRoute: Route {
    case newsList
    case newsDetail(id: String)
    case codesList
    case codeDetail(id: String)
    case referenceList
    case referenceDetail(id: String)
    case reviewsList
    case reviewDetail(id: String)

    var id: String {
        switch self {
        case .newsList:
            return "news-list"
        case .newsDetail(let id):
            return "news-detail-\(id)"
        case .codesList:
            return "codes-list"
        case .codeDetail(let id):
            return "code-detail-\(id)"
        case .referenceList:
            return "reference-list"
        case .referenceDetail(let id):
            return "reference-detail-\(id)"
        case .reviewsList:
            return "reviews-list"
        case .reviewDetail(let id):
            return "review-detail-\(id)"
        }
    }
}
