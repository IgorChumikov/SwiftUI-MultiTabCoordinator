//
//  AppTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

enum AppTab: String, CaseIterable, Identifiable {
    case home, favorites, history, profile
    
    var id: String { rawValue }
    
    var title: String {
        switch self {
        case .home: return "Главное"
        case .favorites: return "Избранное"
        case .history: return "История"
        case .profile: return "Профиль"
        }
    }
    
    var icon: String {
        switch self {
        case .home: return "briefcase.fill"
        case .favorites: return "star"
        case .history: return "clock.arrow.circlepath"
        case .profile: return "person.fill"
        }
    }
}
