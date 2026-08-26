//
//  TabBarCoordinator.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

// MARK: - TabBarCoordinator

final class TabBarCoordinator: ObservableObject {
    
    // MARK: - Properties
    
    @Published var selectedTab: AppTab = .home {
        didSet {
            guard oldValue != selectedTab else { return }
            onEvent?(.selectedTab(selectedTab, isAtRoot: isAtRoot(selectedTab)))
        }
    }
    
    // MARK: - Tab Coordinators
    
    let home = NavigationCoordinator<HomeRoute>()
    let favorites = NavigationCoordinator<FavoritesRoute>()
    let history = NavigationCoordinator<HistoryRoute>()
    let profile = NavigationCoordinator<ProfileRoute>()
    
    // MARK: - Global Presentation
    
    @Published var globalSheet: GlobalSheet?
    @Published var globalCover: GlobalCover?

    // MARK: - Events

    /// См. `NavigationCoordinator.onEvent`: замыкание не должно захватывать
    /// сам координатор.
    var onEvent: ((TabBarEvent) -> Void)?
    
    // MARK: - Tab Selection

    /// Точка входа для таб-бара. Отдельный метод нужен, чтобы отличить
    /// повторный тап по активному табу от переключения: присваивание того же
    /// значения `selectedTab` не вызывает `didSet`, и событие потерялось бы.
    func select(_ tab: AppTab) {
        guard tab != selectedTab else {
            onEvent?(.reselectedTab(tab, isAtRoot: isAtRoot(tab)))
            return
        }
        selectedTab = tab
    }

    // MARK: - Public Navigation
    
    func showCart() {
        selectedTab = .history
    }
    
    // MARK: - DeepLink (Public)
    
    func handle(_ url: URL) {
        guard let deepLink = AppDeepLink(url: url) else { return }
        handle(deepLink)
    }
    
    // MARK: - Sheet
    
    func showGlobalSheet(_ sheet: GlobalSheet) {
        globalSheet = sheet
        onEvent?(.presentedSheet(sheet))
    }
    
    func dismissGlobalSheet() {
        globalSheet = nil
    }
    
    // MARK: - Full Screen Cover
    
    func showGlobalCover(_ cover: GlobalCover) {
        globalCover = cover
        onEvent?(.presentedCover(cover))
    }
    
    func dismissGlobalCover() {
        globalCover = nil
    }
}

// MARK: - Stack State

private extension TabBarCoordinator {

    /// Пустой ли стек у таба, то есть окажется ли пользователь на его корне.
    func isAtRoot(_ tab: AppTab) -> Bool {
        switch tab {
        case .home: return home.path.isEmpty
        case .favorites: return favorites.path.isEmpty
        case .history: return history.path.isEmpty
        case .profile: return profile.path.isEmpty
        }
    }
}

// MARK: - DeepLink Handling

private extension TabBarCoordinator {
    
    func handle(_ deepLink: AppDeepLink) {
        switch deepLink {
            // Terminal:
            // xcrun simctl openurl booted "enterprise://profile/about"
            // or:
            // xcrun simctl openurl booted "enterprise://about"
        case .profileAbout:
            selectedTab = .profile
            profile.popToRoot()
            profile.push(.aboutApp)
            // Terminal:
            // xcrun simctl openurl booted "enterprise://profile/settings"
        case .profileSettings:
            selectedTab = .profile
            profile.popToRoot()
            profile.push(.settings)
        }
    }
}
