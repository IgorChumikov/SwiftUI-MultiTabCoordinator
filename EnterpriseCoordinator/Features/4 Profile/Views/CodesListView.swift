//
//  CodesListView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct CodesListView: View {
    @ObservedObject var coordinator: NavigationCoordinator<ProfileRoute>

    var body: some View {
        List(ProfileMockData.codes) { item in
            Button {
                coordinator.push(.codeDocument(id: item.id))
            } label: {
                VStack(alignment: .leading, spacing: 6) {
                    Text("\(item.number) • \(item.title)")
                        .font(.headline)
                        .foregroundStyle(.primary)
                        .lineLimit(2)

                    Text("Обновлено: \(item.updatedAt.formatted(date: .abbreviated, time: .omitted))")
                        .font(.caption)
                        .foregroundStyle(.secondary)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Кодексы")
    }
}

#Preview {
    CodesListView(coordinator: NavigationCoordinator<ProfileRoute>())
}
