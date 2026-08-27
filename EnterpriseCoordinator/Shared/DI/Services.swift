//
//  Services.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import Foundation

// MARK: - Service Protocols
//
// Разбиты по предметным областям, а не свалены в один протокол: каждая
// вью-модель должна зависеть ровно от того, чем пользуется. Реализации пока
// отдают моки, но сигнатуры уже асинхронные — состояние загрузки, ради
// которого вью-моделям и нужно жить, должно быть настоящим.

protocol NewsServicing {
    func news() async -> [NewsItem]
    func newsItem(id: String) async -> NewsItem?
    func homePreview() async -> [HomeNewsPreviewItem]
}

protocol DocumentServicing {
    func isAvailableOffline(documentID: String) -> Bool
    func markAsRead(documentID: String)

    func codes() async -> [CodeItem]
    func code(id: String) async -> CodeItem?
    func homePreview(for kind: HomeSectionKind) async -> [HomeDocumentPreviewItem]
}

protocol HistoryServicing {
    func documents() async -> [DocumentHistory]
}

protocol AnalyticsServicing {
    func track(_ event: String)
}

protocol AuthServicing {
    var isAuthorized: Bool { get }
}

// MARK: - Stub Implementations

struct StubNewsService: NewsServicing {
    func news() async -> [NewsItem] { ProfileMockData.news }

    func newsItem(id: String) async -> NewsItem? {
        ProfileMockData.news.first { $0.id == id }
    }

    func homePreview() async -> [HomeNewsPreviewItem] { HomeMockData.newsPreview }
}

struct StubDocumentService: DocumentServicing {
    func isAvailableOffline(documentID: String) -> Bool { true }

    func markAsRead(documentID: String) {
        #if DEBUG
        print("[documents] read: \(documentID)")
        #endif
    }

    func codes() async -> [CodeItem] { ProfileMockData.codes }

    func code(id: String) async -> CodeItem? {
        ProfileMockData.codes.first { $0.id == id }
    }

    func homePreview(for kind: HomeSectionKind) async -> [HomeDocumentPreviewItem] {
        switch kind {
        case .news:      return []
        case .codes:     return HomeMockData.codesPreview
        case .reference: return HomeMockData.referencePreview
        case .reviews:   return HomeMockData.reviewsPreview
        }
    }
}

struct StubHistoryService: HistoryServicing {
    func documents() async -> [DocumentHistory] {
        [
            DocumentHistory(id: "1", title: "Договор аренды"),
            DocumentHistory(id: "2", title: "Акт приёма-передачи"),
            DocumentHistory(id: "3", title: "Счёт на оплату")
        ]
    }
}

struct StubAnalyticsService: AnalyticsServicing {
    func track(_ event: String) {
        #if DEBUG
        print("[analytics] \(event)")
        #endif
    }
}

struct StubAuthService: AuthServicing {
    var isAuthorized: Bool { false }
}
