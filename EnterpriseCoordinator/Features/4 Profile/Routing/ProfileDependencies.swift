//
//  ProfileDependencies.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import Foundation

protocol ProfileDependencies {
    var newsService: NewsServicing { get }
    var documentService: DocumentServicing { get }
    var analytics: AnalyticsServicing { get }
    var authService: AuthServicing { get }
}
