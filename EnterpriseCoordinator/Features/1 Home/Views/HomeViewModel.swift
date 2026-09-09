//
//  HomeViewModel.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 26.08.2026.
//

import Foundation
import Combine

@MainActor
final class HomeViewModel: ObservableObject {

    // MARK: - Published

    @Published private(set) var newsPreview: [HomeNewsPreviewItem] = []
    @Published private(set) var documentPreviews: [HomeSectionKind: [HomeDocumentPreviewItem]] = [:]

    // MARK: - Dependencies

    private let newsService: NewsServicing
    private let documentService: DocumentServicing
    private let navigator: HomeNavigating

    private var hasLoaded = false

    // MARK: - Init

    init(newsService: NewsServicing,
         documentService: DocumentServicing,
         navigator: HomeNavigating) {
        self.newsService = newsService
        self.documentService = documentService
        self.navigator = navigator
    }

    // MARK: - Output

    func preview(for kind: HomeSectionKind) -> [HomeDocumentPreviewItem] {
        documentPreviews[kind] ?? []
    }

    // MARK: - Input

    func onAppear() async {
        guard !hasLoaded else { return }
        hasLoaded = true

        newsPreview = await newsService.homePreview()

        var previews: [HomeSectionKind: [HomeDocumentPreviewItem]] = [:]
        for kind in [HomeSectionKind.codes, .reference, .reviews] {
            previews[kind] = await documentService.homePreview(for: kind)
        }
        documentPreviews = previews
    }

    func openSection(_ kind: HomeSectionKind) {
        navigator.openSection(kind)
    }

    func openScanner() {
        navigator.openScanner()
    }

    func openQuickView(documentID: String) {
        documentService.markAsRead(documentID: documentID)
        navigator.openQuickView(documentID: documentID)
    }
}
