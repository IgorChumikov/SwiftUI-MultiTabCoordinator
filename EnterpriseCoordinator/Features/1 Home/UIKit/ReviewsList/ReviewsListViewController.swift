//
//  ReviewsListViewController.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import UIKit

final class ReviewsListViewController: UITableViewController {
    var coordinator: NavigationCoordinator<HomeRoute>!
    var items: [HomeDocumentItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = HomeSectionKind.reviews.title
        configureHomeDocumentTable()
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        items.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        makeHomeDocumentCell(in: tableView, indexPath: indexPath, title: items[indexPath.row].title)
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        coordinator.push(.reviewDetail(id: items[indexPath.row].id))
    }
}
