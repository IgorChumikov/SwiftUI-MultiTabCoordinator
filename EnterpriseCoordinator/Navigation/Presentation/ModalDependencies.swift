//
//  ModalDependencies.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 25.08.2026.
//

import Foundation

/// Зависимости, нужные глобальным модалкам. Локальные модалки сервисов
/// пока не требуют, поэтому у `LocalModalRouter` зависимостей нет.
protocol ModalDependencies {
    var authService: AuthServicing { get }
}
