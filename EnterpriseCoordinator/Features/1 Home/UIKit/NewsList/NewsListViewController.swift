//
//  NewsListViewController.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import UIKit

final class NewsListViewController: UITableViewController {
    private let navigator: HomeNavigating
    private let items: [HomeNewsArticle]

    init(navigator: HomeNavigating, items: [HomeNewsArticle]) {
        self.navigator = navigator
        self.items = items
        super.init(style: .plain)
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
        navigator.openDocument(id: items[indexPath.row].id, in: .news)
    }
}
