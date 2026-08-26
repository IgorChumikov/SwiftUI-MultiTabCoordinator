//
//  NewsDetailViewController.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import UIKit

final class NewsDetailViewController: UIViewController {
    private let navigator: HomeNavigating
    private let documentService: DocumentServicing
    private let newsID: String

    init(navigator: HomeNavigating, documentService: DocumentServicing, newsID: String) {
        self.navigator = navigator
        self.documentService = documentService
        self.newsID = newsID
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Новость"
        view.backgroundColor = .systemBackground

        guard let article = HomeMockData.newsArticles.first(where: { $0.id == newsID }) else { return }

        let scrollView = UIScrollView()
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 14
        stackView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        scrollView.addSubview(stackView)
        view.addSubview(scrollView)

        NSLayoutConstraint.activate([
            scrollView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            scrollView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
            stackView.topAnchor.constraint(equalTo: scrollView.contentLayoutGuide.topAnchor, constant: 20),
            stackView.leadingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: scrollView.frameLayoutGuide.trailingAnchor, constant: -20),
            stackView.bottomAnchor.constraint(equalTo: scrollView.contentLayoutGuide.bottomAnchor, constant: -24)
        ])

        let titleLabel = UILabel()
        titleLabel.font = .systemFont(ofSize: 24, weight: .bold)
        titleLabel.numberOfLines = 0
        titleLabel.text = article.title

        let subtitleLabel = UILabel()
        subtitleLabel.font = .systemFont(ofSize: 16, weight: .regular)
        subtitleLabel.numberOfLines = 0
        subtitleLabel.text = article.subtitle

        let dateLabel = UILabel()
        dateLabel.font = .systemFont(ofSize: 13, weight: .medium)
        dateLabel.textColor = HomeUIKitStyle.secondaryText
        dateLabel.text = article.dateText

        let bodyLabel = UILabel()
        bodyLabel.font = .systemFont(ofSize: 16, weight: .regular)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = article.body

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(subtitleLabel)
        stackView.addArrangedSubview(dateLabel)

        if documentService.isAvailableOffline(documentID: newsID) == true {
            let offlineLabel = UILabel()
            offlineLabel.font = .systemFont(ofSize: 13, weight: .medium)
            offlineLabel.textColor = HomeUIKitStyle.secondaryText
            offlineLabel.text = "Доступно офлайн"
            stackView.addArrangedSubview(offlineLabel)
        }
        stackView.addArrangedSubview(makeHomeDivider())
        stackView.addArrangedSubview(bodyLabel)

        if !article.relatedIDs.isEmpty {
            let relatedTitle = UILabel()
            relatedTitle.font = .systemFont(ofSize: 17, weight: .semibold)
            relatedTitle.text = "Связанные новости"
            stackView.addArrangedSubview(makeHomeDivider())
            stackView.addArrangedSubview(relatedTitle)

            article.relatedIDs.forEach { relatedID in
                let relatedTitleText = HomeMockData.newsArticles.first(where: { $0.id == relatedID })?.title ?? "Открыть новость"
                let button = makeHomeLinkButton(title: relatedTitleText) { [weak self] in
                    self?.navigator.openDocument(id: relatedID, in: .news)
                }
                stackView.addArrangedSubview(button)
            }
        }

        // Локальная модалка, инициированная из UIKit-экрана.
        stackView.addArrangedSubview(makeHomeDivider())
        let videoButton = makeHomeLinkButton(title: "Смотреть видеообзор") { [weak self, newsID] in
            self?.navigator.openVideo(url: "https://example.com/\(newsID).mp4")
        }
        stackView.addArrangedSubview(videoButton)
    }
}
