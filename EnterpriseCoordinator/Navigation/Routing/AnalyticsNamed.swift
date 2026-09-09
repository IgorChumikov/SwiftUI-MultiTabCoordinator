//
//  AnalyticsNamed.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation

/// Имя экрана для событий — без ассоциированных значений, чтобы у события
/// не было бесконечной кардинальности (`newsDetail`, а не `newsDetail-42`).
protocol AnalyticsNamed {
    var analyticsName: String { get }
}

extension AnalyticsNamed {
    /// Дефолт: имя кейса. Для кейса с ассоциированными значениями `Mirror`
    /// отдаёт его меткой, для кейса без значений — берётся `String(describing:)`.
    /// Если понадобится своё имя, его всегда можно задать явно в самом енаме.
    var analyticsName: String {
        Mirror(reflecting: self).children.first?.label ?? String(describing: self)
    }
}
