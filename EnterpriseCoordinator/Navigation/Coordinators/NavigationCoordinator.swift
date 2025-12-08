//
//  NavigationCoordinator.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

// MARK: - NavigationCoordinator

final class NavigationCoordinator<RouteType: Route>: ObservableObject {
    
    // MARK: - Published Properties
    
    @Published var path = NavigationPath()
    
    // MARK: - Local Presentation
    
    @Published var localSheet: LocalSheet?
    @Published var localCover: LocalCover?
    
    // MARK: - Navigation
    
    func push(_ route: RouteType) {
        path.append(route)
    }
    
    func pop() {
        guard !path.isEmpty else { return }
        path.removeLast()
    }
    
    func popToRoot() {
        path.removeLast(path.count)
    }
    
    // MARK: - Sheet Presentation
    
    func showLocalSheet(_ localSheet: LocalSheet) {
        self.localSheet = localSheet
    }
    
    func dismissLocalSheet() {
        localSheet = nil
    }
    
    // MARK: - Full Screen Cover Presentation
    
    func showLocalCover(_ localCover: LocalCover) {
        self.localCover = localCover
    }
    
    func dismissLocalCover() {
        localCover = nil
    }
}
