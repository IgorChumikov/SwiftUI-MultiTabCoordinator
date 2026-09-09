//
//  EnterpriseCoordinatorApp.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

@main
struct EnterpriseCoordinatorApp: App {

    /// Сервисы общие на процесс: второе окно не должно поднимать
    /// вторую сессию или второй сетевой клиент.
    /// Граф навигации, наоборот, создаётся в `AppCoordinatorView` — свой на окно.
    private let container = AppContainer.live

    init() {
        let appearance = UITabBarAppearance()
        appearance.configureWithOpaqueBackground()
        appearance.backgroundColor = UIColor(red: 248 / 255, green: 248 / 255, blue: 249 / 255, alpha: 1)

        UITabBar.appearance().standardAppearance = appearance
        UITabBar.appearance().scrollEdgeAppearance = appearance
        UITabBar.appearance().tintColor = UIColor(red: 128 / 255, green: 108 / 255, blue: 187 / 255, alpha: 1)
        UITabBar.appearance().unselectedItemTintColor = UIColor.systemGray2
    }

    var body: some Scene {
        WindowGroup {
            AppCoordinatorView(container: container)
        }
    }
}
