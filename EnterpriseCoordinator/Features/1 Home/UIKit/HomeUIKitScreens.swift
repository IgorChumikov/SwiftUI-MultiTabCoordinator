//
//  HomeUIKitScreens.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import SwiftUI
import UIKit

struct HomeUIKitViewControllerScreen: UIViewControllerRepresentable {
    let makeViewController: () -> UIViewController

    func makeUIViewController(context: Context) -> UIViewController {
        makeViewController()
    }

    func updateUIViewController(_ uiViewController: UIViewController, context: Context) {}
}

final class HomeUIKitCoordinator {
    private let navigation: NavigationCoordinator<HomeRoute>

    init(navigation: NavigationCoordinator<HomeRoute>) {
        self.navigation = navigation
    }

    func showNewsList() {
        navigation.push(.newsList)
    }

    func showNewsDetail(id: String) {
        navigation.push(.newsDetail(id: id))
    }

    func showCodesList() {
        navigation.push(.codesList)
    }

    func showCodeDetail(id: String) {
        navigation.push(.codeDetail(id: id))
    }

    func showReferenceList() {
        navigation.push(.referenceList)
    }

    func showReferenceDetail(id: String) {
        navigation.push(.referenceDetail(id: id))
    }

    func showReviewsList() {
        navigation.push(.reviewsList)
    }

    func showReviewDetail(id: String) {
        navigation.push(.reviewDetail(id: id))
    }
}

enum HomeUIKitStyle {
    static let groupedBackground = UIColor(red: 240 / 255, green: 240 / 255, blue: 242 / 255, alpha: 1)
    static let cardBackground = UIColor(red: 248 / 255, green: 248 / 255, blue: 249 / 255, alpha: 1)
    static let separator = UIColor(red: 220 / 255, green: 220 / 255, blue: 223 / 255, alpha: 1)
    static let secondaryText = UIColor(red: 145 / 255, green: 145 / 255, blue: 150 / 255, alpha: 1)
}

final class NewsListViewController: UITableViewController {
    private let items: [HomeNewsArticle]
    private let coordinator: HomeUIKitCoordinator

    init(items: [HomeNewsArticle], coordinator: HomeUIKitCoordinator) {
        self.items = items
        self.coordinator = coordinator
        super.init(style: .insetGrouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = HomeSectionKind.news.title
        tableView.backgroundColor = HomeUIKitStyle.groupedBackground
        tableView.separatorColor = HomeUIKitStyle.separator
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 88
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "NewsCell")
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let article = items[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "NewsCell", for: indexPath)
        var content = UIListContentConfiguration.subtitleCell()
        content.text = article.title
        content.secondaryText = "\(article.subtitle)\n\(article.dateText)"
        content.secondaryTextProperties.numberOfLines = 3
        content.textProperties.numberOfLines = 2
        content.textProperties.font = .systemFont(ofSize: 18, weight: .medium)
        content.secondaryTextProperties.color = HomeUIKitStyle.secondaryText
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = HomeUIKitStyle.cardBackground
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.showNewsDetail(id: items[indexPath.row].id)
    }
}

final class NewsDetailViewController: UIViewController {
    private let newsID: String
    private let coordinator: HomeUIKitCoordinator

    init(newsID: String, coordinator: HomeUIKitCoordinator) {
        self.newsID = newsID
        self.coordinator = coordinator
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
        stackView.addArrangedSubview(makeDivider())
        stackView.addArrangedSubview(bodyLabel)

        if !article.relatedIDs.isEmpty {
            let relatedTitle = UILabel()
            relatedTitle.font = .systemFont(ofSize: 17, weight: .semibold)
            relatedTitle.text = "Связанные новости"
            stackView.addArrangedSubview(makeDivider())
            stackView.addArrangedSubview(relatedTitle)

            article.relatedIDs.forEach { relatedID in
                let relatedTitleText = HomeMockData.newsArticles.first(where: { $0.id == relatedID })?.title ?? "Открыть новость"
                let button = makeLinkButton(title: relatedTitleText) { [weak self] in
                    self?.coordinator.showNewsDetail(id: relatedID)
                }
                stackView.addArrangedSubview(button)
            }
        }
    }
}

final class CodesListViewController: UITableViewController {
    private let items: [HomeDocumentItem]
    private let coordinator: HomeUIKitCoordinator

    init(items: [HomeDocumentItem], coordinator: HomeUIKitCoordinator) {
        self.items = items
        self.coordinator = coordinator
        super.init(style: .insetGrouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = HomeSectionKind.codes.title
        configureTable()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        makeDocumentCell(in: tableView, indexPath: indexPath, title: items[indexPath.row].title)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.showCodeDetail(id: items[indexPath.row].id)
    }
}

final class CodesDetailViewController: HomeDocumentDetailViewController {
    override func openRelatedDocument(id: String) {
        coordinator.showCodeDetail(id: id)
    }
}

final class ReferenceListViewController: UITableViewController {
    private let items: [HomeDocumentItem]
    private let coordinator: HomeUIKitCoordinator

    init(items: [HomeDocumentItem], coordinator: HomeUIKitCoordinator) {
        self.items = items
        self.coordinator = coordinator
        super.init(style: .insetGrouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = HomeSectionKind.reference.title
        configureTable()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        makeDocumentCell(in: tableView, indexPath: indexPath, title: items[indexPath.row].title)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.showReferenceDetail(id: items[indexPath.row].id)
    }
}

final class ReferenceDetailViewController: HomeDocumentDetailViewController {
    override func openRelatedDocument(id: String) {
        coordinator.showReferenceDetail(id: id)
    }
}

final class ReviewsListViewController: UITableViewController {
    private let items: [HomeDocumentItem]
    private let coordinator: HomeUIKitCoordinator

    init(items: [HomeDocumentItem], coordinator: HomeUIKitCoordinator) {
        self.items = items
        self.coordinator = coordinator
        super.init(style: .insetGrouped)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = HomeSectionKind.reviews.title
        configureTable()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        makeDocumentCell(in: tableView, indexPath: indexPath, title: items[indexPath.row].title)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.showReviewDetail(id: items[indexPath.row].id)
    }
}

final class ReviewsDetailViewController: HomeDocumentDetailViewController {
    override func openRelatedDocument(id: String) {
        coordinator.showReviewDetail(id: id)
    }
}

class HomeDocumentDetailViewController: UIViewController {
    let documentID: String
    let screenTitle: String
    let documents: [HomeDocumentItem]
    let coordinator: HomeUIKitCoordinator

    init(documentID: String, title: String, documents: [HomeDocumentItem], coordinator: HomeUIKitCoordinator) {
        self.documentID = documentID
        self.screenTitle = title
        self.documents = documents
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }

    @available(*, unavailable)
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = screenTitle
        view.backgroundColor = .systemBackground

        guard let document = documents.first(where: { $0.id == documentID }) else { return }

        let scrollView = UIScrollView()
        let stackView = UIStackView()
        stackView.axis = .vertical
        stackView.spacing = 16
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
        titleLabel.text = document.title

        let bodyLabel = UILabel()
        bodyLabel.font = .systemFont(ofSize: 16, weight: .regular)
        bodyLabel.numberOfLines = 0
        bodyLabel.text = document.content

        stackView.addArrangedSubview(titleLabel)
        stackView.addArrangedSubview(makeDivider())
        stackView.addArrangedSubview(bodyLabel)

        if !document.relatedIDs.isEmpty {
            let relatedLabel = UILabel()
            relatedLabel.font = .systemFont(ofSize: 17, weight: .semibold)
            relatedLabel.text = "Связанные документы"
            stackView.addArrangedSubview(makeDivider())
            stackView.addArrangedSubview(relatedLabel)

            document.relatedIDs.forEach { relatedID in
                let buttonTitle = documents.first(where: { $0.id == relatedID })?.title ?? "Открыть документ"
                let button = makeLinkButton(title: buttonTitle) { [weak self] in
                    self?.openRelatedDocument(id: relatedID)
                }
                stackView.addArrangedSubview(button)
            }
        }
    }

    func openRelatedDocument(id: String) {}
}

private extension UITableViewController {
    func configureTable() {
        tableView.backgroundColor = HomeUIKitStyle.groupedBackground
        tableView.separatorColor = HomeUIKitStyle.separator
        tableView.rowHeight = 72
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DocumentCell")
    }

    func makeDocumentCell(in tableView: UITableView, indexPath: IndexPath, title: String) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "DocumentCell", for: indexPath)
        var content = UIListContentConfiguration.cell()
        content.text = title
        content.textProperties.font = .systemFont(ofSize: 18, weight: .regular)
        content.textProperties.numberOfLines = 2
        cell.contentConfiguration = content
        cell.accessoryType = .disclosureIndicator
        cell.backgroundColor = HomeUIKitStyle.cardBackground
        return cell
    }
}

private extension UIViewController {
    func makeDivider() -> UIView {
        let divider = UIView()
        divider.backgroundColor = HomeUIKitStyle.separator
        divider.translatesAutoresizingMaskIntoConstraints = false
        divider.heightAnchor.constraint(equalToConstant: 1).isActive = true
        return divider
    }

    func makeLinkButton(title: String, action: @escaping () -> Void) -> UIButton {
        let button = UIButton(type: .system)
        var configuration = UIButton.Configuration.plain()
        configuration.contentInsets = NSDirectionalEdgeInsets(top: 6, leading: 0, bottom: 6, trailing: 0)
        configuration.title = title
        button.configuration = configuration
        button.titleLabel?.font = .systemFont(ofSize: 16, weight: .medium)
        button.contentHorizontalAlignment = .leading
        button.addAction(UIAction { _ in action() }, for: .touchUpInside)
        return button
    }
}
