//
//  CodeDetailViewController.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 03.03.2026.
//

import UIKit

final class CodeDetailViewController: HomeDocumentDetailViewController {
    override func openRelatedDocument(id: String) {
        coordinator.push(.codeDetail(id: id))
    }
}
