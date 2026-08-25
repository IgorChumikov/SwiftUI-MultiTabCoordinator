//
//  Services.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import Foundation

// MARK: - Service Protocols
// Заглушки: сигнатуры намеренно минимальные, но не пустые —
// так видно, что зависимость реально доезжает до экрана, а не просто лежит в Router.

protocol DocumentServicing {
    /// Реальная реализация пойдёт в кэш/БД.
    func isAvailableOffline(documentID: String) -> Bool
}

protocol AnalyticsServicing {
    func track(_ event: String)
}

protocol AuthServicing {
    var isAuthorized: Bool { get }
}

// MARK: - Stub Implementations

struct StubDocumentService: DocumentServicing {
    func isAvailableOffline(documentID: String) -> Bool { true }
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
