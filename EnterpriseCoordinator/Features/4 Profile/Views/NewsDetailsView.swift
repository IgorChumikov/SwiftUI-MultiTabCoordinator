//
//  NewsDetailsView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct NewsDetailsView: View {
    let newsId: String

    private var news: NewsItem? {
        ProfileMockData.news.first { $0.id == newsId }
    }

    var body: some View {
        Group {
            if let news {
                ScrollView {
                    VStack(alignment: .leading, spacing: 14) {
                        Text(news.title)
                            .font(.title2)
                            .fontWeight(.semibold)

                        Text(news.date, style: .date)
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Text(news.details)
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            } else {
                ContentUnavailableView("Новость не найдена", systemImage: "newspaper")
            }
        }
        .navigationTitle("Новость")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NewsDetailsView(newsId: "news-001")
}
