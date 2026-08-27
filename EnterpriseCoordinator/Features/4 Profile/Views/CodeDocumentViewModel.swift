//
//  CodeDocumentViewModel.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation
import Combine

@MainActor
final class CodeDocumentViewModel: ObservableObject {

    enum State {
        case loading
        case loaded(CodeItem, isAvailableOffline: Bool)
        case notFound
    }

    @Published private(set) var state: State = .loading

    private let codeID: String
    private let documentService: DocumentServicing

    init(codeID: String, documentService: DocumentServicing) {
        self.codeID = codeID
        self.documentService = documentService
    }

    func onAppear() async {
        guard case .loading = state else { return }

        guard let item = await documentService.code(id: codeID) else {
            state = .notFound
            return
        }
        state = .loaded(item, isAvailableOffline: documentService.isAvailableOffline(documentID: codeID))
    }
}
