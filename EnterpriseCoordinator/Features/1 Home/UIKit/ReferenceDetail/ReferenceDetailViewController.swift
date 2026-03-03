//
//  ReferenceDetailViewController.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import UIKit

final class ReferenceDetailViewController: HomeDocumentDetailViewController {
    override func openRelatedDocument(id: String) {
        coordinator.push(.referenceDetail(id: id))
    }
}
