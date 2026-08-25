//
//  GlobalCover.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import Foundation

/// Модалка уровня приложения: перекрывает всё, переживает переключение таба,
/// не принадлежит ни одной фиче. Показывается через `TabBarCoordinator`.
enum GlobalCover: Identifiable {
    case login
    
    var id: String {
        switch self {
        case .login: return "login"
        }
    }
}
