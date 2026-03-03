//
//  ReviewDetailViewController.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import UIKit

final class ReviewDetailViewController: HomeDocumentDetailViewController {
    override func openRelatedDocument(id: String) {
        coordinator.push(.reviewDetail(id: id))
    }
}
