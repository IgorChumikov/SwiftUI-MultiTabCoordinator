//
//  NewsDetailsView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct NewsDetailsView: View {
    @StateObject private var viewModel: NewsDetailsViewModel

    init(viewModel: @autoclosure @escaping () -> NewsDetailsViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        content
            .navigationTitle("Новость")
            .navigationBarTitleDisplayMode(.inline)
            .task { await viewModel.onAppear() }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .notFound:
            PlaceholderView(systemImage: "newspaper", title: "Новость не найдена")

        case .loaded(let news, let isAvailableOffline):
            ScrollView {
                VStack(alignment: .leading, spacing: 14) {
                    Text(news.title)
                        .font(.title2)
                        .fontWeight(.semibold)

                    Text(news.date, style: .date)
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    if isAvailableOffline {
                        Label("Доступно офлайн", systemImage: "arrow.down.circle")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Text(news.details)
                        .font(.body)
                }
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding()
            }
        }
    }
}

#Preview {
    NavigationStack {
        NewsDetailsView(
            viewModel: NewsDetailsViewModel(
                newsID: "news-001",
                newsService: StubNewsService(),
                documentService: StubDocumentService()
            )
        )
    }
}
