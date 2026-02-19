//
//  CodeDocumentView.swift
//  EnterpriseCoordinator
//
//  Created by Igor on 19.02.2026.
//

import SwiftUI

struct CodeDocumentView: View {
    let codeId: String

    private var code: CodeItem? {
        ProfileMockData.codes.first { $0.id == codeId }
    }

    var body: some View {
        Group {
            if let code {
                ScrollView {
                    VStack(alignment: .leading, spacing: 12) {
                        Text("\(code.number) • \(code.title)")
                            .font(.title3)
                            .fontWeight(.semibold)

                        Text("Обновлено: \(code.updatedAt.formatted(date: .long, time: .omitted))")
                            .font(.caption)
                            .foregroundStyle(.secondary)

                        Divider()

                        Text(code.document)
                            .font(.body)
                    }
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding()
                }
            } else {
                ContentUnavailableView("Документ не найден", systemImage: "doc.text")
            }
        }
        .navigationTitle("Документ")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CodeDocumentView(codeId: "code-001")
}
