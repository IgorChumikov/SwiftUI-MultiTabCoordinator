//
//  CodesListViewModel.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation
import Combine

@MainActor
final class CodesListViewModel: ObservableObject {

    enum State {
        case loading
        case loaded([CodeItem])
        case empty
    }

    @Published private(set) var state: State = .loading

    private let documentService: DocumentServicing
    private let navigator: ProfileNavigating

    init(documentService: DocumentServicing, navigator: ProfileNavigating) {
        self.documentService = documentService
        self.navigator = navigator
    }

    func onAppear() async {
        guard case .loading = state else { return }

        let items = await documentService.codes()
        state = items.isEmpty ? .empty : .loaded(items)
    }

    func didSelect(_ item: CodeItem) {
        documentService.markAsRead(documentID: item.id)
        navigator.openCodeDocument(id: item.id)
    }
}
