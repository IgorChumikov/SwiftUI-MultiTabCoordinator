//
//  UIKitViewControllerContainer.swift
//  EnterpriseCoordinator
//
//  Created by Codex on 08.04.2026.
//

import SwiftUI
import UIKit

// MARK: - UIKitViewControllerContainer

/// Контейнер для `UIViewController` элементов, позволяющий использовать их в SwiftUI.
struct UIKitViewControllerContainer<ViewController: UIViewController>: UIViewControllerRepresentable {
    // MARK: - Types

    typealias UIViewControllerType = ViewController

    // MARK: - Properties

    private let makeViewController: () -> ViewController
    private let updateViewController: (ViewController) -> Void

    // MARK: - Init

    /// Создает `UIKitViewControllerContainer`.
    /// - Parameters:
    ///   - makeViewController: Замыкание для создания `UIViewController`.
    ///   - updateViewController: Замыкание для конфигурации и обновления `UIViewController`.
    init(
        makeViewController: @escaping () -> ViewController,
        updateViewController: @escaping (ViewController) -> Void = { _ in }
    ) {
        self.makeViewController = makeViewController
        self.updateViewController = updateViewController
    }

    // MARK: - Functions

    /// Создает `UIViewController` для встраивания в SwiftUI.
    func makeUIViewController(context: Context) -> ViewController {
        let viewController = makeViewController()
        updateViewController(viewController)
        return viewController
    }

    /// Обновляет `UIViewController` при изменении SwiftUI-состояния.
    func updateUIViewController(_ uiViewController: ViewController, context: Context) {
        updateViewController(uiViewController)
    }
}
