//
//  HomeDocumentDetailViewController.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import UIKit

class HomeDocumentDetailViewController: UIViewController {
    var coordinator: NavigationCoordinator<HomeRoute>!
    var documentID: String!
    var documents: [HomeDocumentItem] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Документ"
        view.backgroundColor = .systemBackground

        guard let documentID, let document = documents.first(where: { $0.id == documentID }) else { return }

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
        stackView.addArrangedSubview(makeHomeDivider())
        stackView.addArrangedSubview(bodyLabel)

        if !document.relatedIDs.isEmpty {
            let relatedLabel = UILabel()
            relatedLabel.font = .systemFont(ofSize: 17, weight: .semibold)
            relatedLabel.text = "Связанные документы"
            stackView.addArrangedSubview(makeHomeDivider())
            stackView.addArrangedSubview(relatedLabel)

            document.relatedIDs.forEach { relatedID in
                let buttonTitle = documents.first(where: { $0.id == relatedID })?.title ?? "Открыть документ"
                let button = makeHomeLinkButton(title: buttonTitle) { [weak self] in
                    self?.openRelatedDocument(id: relatedID)
                }
                stackView.addArrangedSubview(button)
            }
        }
    }

    func openRelatedDocument(id: String) {}
}
