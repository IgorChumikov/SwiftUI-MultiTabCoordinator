//
//  HistoryDependencies.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import Foundation

protocol HistoryDependencies {
    var historyService: HistoryServicing { get }
    var analytics: AnalyticsServicing { get }
}
