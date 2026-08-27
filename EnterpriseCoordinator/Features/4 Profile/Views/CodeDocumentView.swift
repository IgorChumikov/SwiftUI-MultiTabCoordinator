//
//  CodeDocumentView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct CodeDocumentView: View {
    @StateObject private var viewModel: CodeDocumentViewModel

    init(viewModel: @autoclosure @escaping () -> CodeDocumentViewModel) {
        _viewModel = StateObject(wrappedValue: viewModel())
    }

    var body: some View {
        content
            .navigationTitle("Документ")
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
            PlaceholderView(systemImage: "doc.text", title: "Документ не найден")

        case .loaded(let code, let isAvailableOffline):
            ScrollView {
                VStack(alignment: .leading, spacing: 12) {
                    Text("\(code.number) • \(code.title)")
                        .font(.title3)
                        .fontWeight(.semibold)

                    Text("Обновлено: \(code.updatedAt.formatted(date: .long, time: .omitted))")
                        .font(.caption)
                        .foregroundStyle(.secondary)

                    if isAvailableOffline {
                        Label("Доступно офлайн", systemImage: "arrow.down.circle")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }

                    Divider()

                    Text(code.document)
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
        CodeDocumentView(
            viewModel: CodeDocumentViewModel(
                codeID: "code-001",
                documentService: StubDocumentService()
            )
        )
    }
}
