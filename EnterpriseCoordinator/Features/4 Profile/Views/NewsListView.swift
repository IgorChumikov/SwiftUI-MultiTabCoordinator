//
//  NewsListView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct NewsListView: View {
    @ObservedObject var coordinator: NavigationCoordinator<ProfileRoute>

    var body: some View {
        List(ProfileMockData.news) { item in
            Button {
                coordinator.push(.newsDetails(id: item.id))
            } label: {
                VStack(alignment: .leading, spacing: 6) {
                    Text(item.title)
                        .font(.headline)
                        .foregroundStyle(.primary)

                    Text(item.summary)
                        .font(.subheadline)
                        .foregroundStyle(.secondary)
                        .lineLimit(2)

                    Text(item.date, style: .date)
                        .font(.caption)
                        .foregroundStyle(.tertiary)
                }
                .padding(.vertical, 4)
            }
        }
        .navigationTitle("Новости")
    }
}

#Preview {
    NewsListView(coordinator: NavigationCoordinator<ProfileRoute>())
}
