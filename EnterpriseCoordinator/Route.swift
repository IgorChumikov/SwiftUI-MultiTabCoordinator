//
//  Route.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

// MARK: - Type-Safe Routes
protocol Route: Hashable, Identifiable {
    var id: String { get }
}
