//
//  NewsListViewModel.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation
import Combine

@MainActor
final class NewsListViewModel: ObservableObject {

    enum State {
        case loading
        case loaded([NewsItem])
        case empty
    }

    // MARK: - Published

    @Published private(set) var state: State = .loading

    // MARK: - Dependencies

    /// Зависит от узких протоколов: ни `NavigationCoordinator`, ни `ProfileRoute`
    /// вью-модель не знает — куда именно ведёт намерение, решает координатор.
    private let newsService: NewsServicing
    private let documentService: DocumentServicing
    private let navigator: ProfileNavigating

    // MARK: - Init

    init(newsService: NewsServicing,
         documentService: DocumentServicing,
         navigator: ProfileNavigating) {
        self.newsService = newsService
        self.documentService = documentService
        self.navigator = navigator
    }

    // MARK: - Input

    func onAppear() async {
        // При возврате по стеку `.task` сработает снова — перезагружать не нужно.
        guard case .loading = state else { return }

        let items = await newsService.news()
        state = items.isEmpty ? .empty : .loaded(items)
    }

    func didSelect(_ item: NewsItem) {
        // Ради этой строки вью-модель и стоит в цепочке: будь тап чистым
        // пробросом, хватило бы вызова навигатора прямо из вью.
        documentService.markAsRead(documentID: item.id)
        navigator.openNewsDetails(id: item.id)
    }
}
