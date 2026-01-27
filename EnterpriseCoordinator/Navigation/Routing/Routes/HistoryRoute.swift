//
//  HistoryRoute.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum HistoryRoute: Route {
    case documentDetails(document: DocumentHistory)
    case allDocumentsHistoryView(documentTitle: String)
    
    var id: String {
        switch self {
        case .documentDetails(document: let document): return "document-\(document.id)"
        case .allDocumentsHistoryView(documentTitle: let documentTitle): return documentTitle
        }
    }
}
