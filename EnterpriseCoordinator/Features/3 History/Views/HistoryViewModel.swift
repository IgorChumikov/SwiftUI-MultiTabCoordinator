//
//  HistoryViewModel.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation
import Combine

@MainActor
final class HistoryViewModel: ObservableObject {

    enum State {
        case loading
        case loaded([DocumentHistory])
        case empty
    }

    @Published private(set) var state: State = .loading

    private let historyService: HistoryServicing
    private let navigator: HistoryNavigating

    init(historyService: HistoryServicing, navigator: HistoryNavigating) {
        self.historyService = historyService
        self.navigator = navigator
    }

    func onAppear() async {
        guard case .loading = state else { return }

        let documents = await historyService.documents()
        state = documents.isEmpty ? .empty : .loaded(documents)
    }

    func didSelect(_ document: DocumentHistory) {
        navigator.openDocumentDetails(document)
    }
}
