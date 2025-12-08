//
//  NavigationCoordinator.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI
import Combine

final class NavigationCoordinator<R: Route>: ObservableObject {
    @Published var path = NavigationPath()
    @Published var sheet: AppSheetScreen?
    @Published var fullScreenCover: AppFullScreenCover?  // ✨ Добавили
    
    // MARK: - Navigation
    
    func push(_ route: R) {
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
    
    func presentSheet(_ sheet: AppSheetScreen) {
        self.sheet = sheet
    }
    
    func dismissSheet() {
        sheet = nil
    }
    
    // MARK: - Full Screen Covers ✨
    
    func presentFullScreenCover(_ cover: AppFullScreenCover) {
        self.fullScreenCover = cover
    }
    
    func dismissFullScreenCover() {
        fullScreenCover = nil
    }
}
