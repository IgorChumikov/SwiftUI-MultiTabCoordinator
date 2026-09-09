//
//  PlaceholderView.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import SwiftUI

/// Пустое состояние. Своя реализация, а не `ContentUnavailableView`,
/// потому что тот доступен только с iOS 17.
struct PlaceholderView: View {
    let systemImage: String
    let title: String

    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: systemImage)
                .font(.largeTitle)
                .foregroundStyle(.secondary)
            Text(title)
                .foregroundStyle(.secondary)
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
    }
}
