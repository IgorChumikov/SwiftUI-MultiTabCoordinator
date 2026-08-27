//
//  HomeDependencies.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import Foundation

protocol HomeDependencies {
    var newsService: NewsServicing { get }
    var documentService: DocumentServicing { get }
    var analytics: AnalyticsServicing { get }
}
