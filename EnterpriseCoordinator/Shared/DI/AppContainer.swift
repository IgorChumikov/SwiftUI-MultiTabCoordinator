//
//  AppContainer.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import Foundation

/// Единственная точка сборки зависимостей приложения (composition root).
/// Конформится сразу ко всем узким `*Dependencies`-протоколам фич —
/// каждый Router видит только то, что объявлено в его собственном протоколе.
struct AppContainer: HomeDependencies, FavoritesDependencies, HistoryDependencies, ProfileDependencies {
    let documentService: DocumentServicing
    let analytics: AnalyticsServicing
    let authService: AuthServicing
}

extension AppContainer {
    static let live = AppContainer(
        documentService: StubDocumentService(),
        analytics: StubAnalyticsService(),
        authService: StubAuthService()
    )

    static let preview = AppContainer(
        documentService: StubDocumentService(),
        analytics: StubAnalyticsService(),
        authService: StubAuthService()
    )
}
