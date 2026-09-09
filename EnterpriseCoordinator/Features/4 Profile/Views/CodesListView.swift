//
//  CodesListView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct CodesListView: View {
    @StateObject private var viewModel: CodesListViewModel

    init(viewModel: @autoclosure @escaping () -> CodesListViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        content
            .navigationTitle("Кодексы")
            .task { await viewModel.onAppear() }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .empty:
            PlaceholderView(systemImage: "doc.text", title: "Кодексов пока нет")

        case .loaded(let items):
            List(items) { item in
                Button {
                    viewModel.didSelect(item)
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
        }
    }
}

#Preview {
    NavigationStack {
        CodesListView(
            viewModel: CodesListViewModel(
                documentService: StubDocumentService(),
                navigator: NavigationCoordinator<ProfileRoute>()
            )
        )
    }
}
