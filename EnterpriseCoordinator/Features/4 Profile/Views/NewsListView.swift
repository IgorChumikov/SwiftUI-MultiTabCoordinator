//
//  NewsListView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct NewsListView: View {

    /// Вью-модель живёт столько же, сколько экран. Параметр — автозамыкание,
    /// потому что `StateObject(wrappedValue:)` вычисляет его ровно один раз:
    /// иначе роутер пересоздавал бы её на каждый рендер.
    @StateObject private var viewModel: NewsListViewModel

    init(viewModel: @autoclosure @escaping () -> NewsListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        content
            .navigationTitle("Новости")
            .task { await viewModel.onAppear() }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .empty:
            PlaceholderView(systemImage: "newspaper", title: "Новостей пока нет")

        case .loaded(let items):
            List(items) { item in
                Button {
                    viewModel.didSelect(item)
                } label: {
                    row(for: item)
                }
            }
        }
    }

    private func row(for item: NewsItem) -> some View {
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

#Preview {
    NavigationStack {
        NewsListView(
            viewModel: NewsListViewModel(
                newsService: StubNewsService(),
                documentService: StubDocumentService(),
                navigator: NavigationCoordinator<ProfileRoute>()
            )
        )
    }
}
