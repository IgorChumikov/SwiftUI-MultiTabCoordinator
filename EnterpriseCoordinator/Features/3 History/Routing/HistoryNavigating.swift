//
//  HistoryNavigating.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation

protocol HistoryNavigating: AnyObject {
    func openDocumentDetails(_ document: DocumentHistory)
}

extension NavigationCoordinator: HistoryNavigating where RouteType == HistoryRoute {
    func openDocumentDetails(_ document: DocumentHistory) {
        push(.documentDetails(document: document))
    }
}
