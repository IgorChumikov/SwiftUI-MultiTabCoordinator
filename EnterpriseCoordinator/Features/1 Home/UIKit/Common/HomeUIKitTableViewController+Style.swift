//
//  HomeUIKitTableViewController+Style.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import UIKit

extension UITableViewController {
    func configureHomeDocumentTable() {
        tableView.backgroundColor = HomeUIKitStyle.groupedBackground
        tableView.separatorColor = HomeUIKitStyle.separator
        tableView.rowHeight = 72
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "DocumentCell")
    }

    func makeHomeDocumentCell(in tableView: UITableView, indexPath: IndexPath, title: String) -> UITableViewCell {
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
