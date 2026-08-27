//
//  HistoryView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HistoryView: View {
    @StateObject private var viewModel: HistoryViewModel

    init(viewModel: @autoclosure @escaping () -> HistoryViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        content
            .navigationTitle("Документы")
            .task { await viewModel.onAppear() }
    }

    @ViewBuilder
    private var content: some View {
        switch viewModel.state {
        case .loading:
            ProgressView()
                .frame(maxWidth: .infinity, maxHeight: .infinity)

        case .empty:
            PlaceholderView(systemImage: "clock", title: "История пуста")

        case .loaded(let documents):
            List(documents) { document in
                Button {
                    viewModel.didSelect(document)
                } label: {
                    Text(document.title)
                }
            }
        }
    }
}

#Preview {
    NavigationStack {
        HistoryView(
            viewModel: HistoryViewModel(
                historyService: StubHistoryService(),
                navigator: NavigationCoordinator<HistoryRoute>()
            )
        )
    }
}
