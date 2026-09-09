//
//  NewsDetailsViewModel.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation
import Combine

@MainActor
final class NewsDetailsViewModel: ObservableObject {

    enum State {
        case loading
        case loaded(NewsItem, isAvailableOffline: Bool)
        case notFound
    }

    @Published private(set) var state: State = .loading

    private let newsID: String
    private let newsService: NewsServicing
    private let documentService: DocumentServicing

    init(newsID: String, newsService: NewsServicing, documentService: DocumentServicing) {
        self.newsID = newsID
        self.newsService = newsService
        self.documentService = documentService
    }

    func onAppear() async {
        guard case .loading = state else { return }

        guard let item = await newsService.newsItem(id: newsID) else {
            state = .notFound
            return
        }
        state = .loaded(item, isAvailableOffline: documentService.isAvailableOffline(documentID: newsID))
    }
}
