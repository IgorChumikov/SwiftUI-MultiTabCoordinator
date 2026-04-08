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
    
    @Published var selectedTab: AppTab = .home
    
    // MARK: - Tab Coordinators
    
    let home = NavigationCoordinator<HomeRoute>()
    let favorites = NavigationCoordinator<FavoritesRoute>()
    let history = NavigationCoordinator<HistoryRoute>()
    let profile = NavigationCoordinator<ProfileRoute>()
    
    // MARK: - Global Presentation
    
    @Published var globalSheet: GlobalSheet?
    @Published var globalCover: GlobalCover?
    
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
    }
    
    func dismissGlobalSheet() {
        globalSheet = nil
    }
    
    // MARK: - Full Screen Cover
    
    func showGlobalCover(_ cover: GlobalCover) {
        globalCover = cover
    }
    
    func dismissGlobalCover() {
        globalCover = nil
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
