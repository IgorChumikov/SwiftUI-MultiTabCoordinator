//
//  NavigationCoordinator.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

final class NavigationCoordinator<RouteType: Route>: ObservableObject {
    @Published var path = NavigationPath()
    
    
    @Published var sheet: LocalCover?
    @Published var fullScreenCover: LocalSheet?
    
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
    
    // MARK: - Sheets
    
    func presentSheet(_ sheet: LocalCover) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    // MARK: - Full Screen Covers ✨
    
    func presentFullScreenCover(_ cover: LocalSheet) {
        self.fullScreenCover = cover
    }
    
    func dismissFullScreenCover() {
        fullScreenCover = nil
    }
}
