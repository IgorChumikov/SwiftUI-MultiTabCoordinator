//
//  HomeNavigating.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation

/// Намерения пользователя на экранах Главной.
///
/// Экраны — и SwiftUI, и UIKit — знают только этот протокол: что именно
/// пользователь хочет открыть. Во что это превратится (push, sheet, cover)
/// и каким маршрутом — решает координатор.
protocol HomeNavigating: AnyObject {
    func openSection(_ kind: HomeSectionKind)
    func openDocument(id: String, in kind: HomeSectionKind)
    func openScanner()
    func openQuickView(documentID: String)
    func openVideo(url: String)
}

extension NavigationCoordinator: HomeNavigating where RouteType == HomeRoute {

    func openSection(_ kind: HomeSectionKind) {
        switch kind {
        case .news:      push(.newsList)
        case .codes:     push(.codesList)
        case .reference: push(.referenceList)
        case .reviews:   push(.reviewsList)
        }
    }

    func openDocument(id: String, in kind: HomeSectionKind) {
        switch kind {
        case .news:      push(.newsDetail(id: id))
        case .codes:     push(.codeDetail(id: id))
        case .reference: push(.referenceDetail(id: id))
        case .reviews:   push(.reviewDetail(id: id))
        }
    }

    func openScanner() {
        showLocalSheet(.camera)
    }

    func openQuickView(documentID: String) {
        showLocalCover(.quickView(productId: documentID))
    }

    func openVideo(url: String) {
        showLocalSheet(.videoPlayer(url: url))
    }
}
