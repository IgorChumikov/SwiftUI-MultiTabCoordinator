//
//  FavoritesRouter.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct FavoritesRouter: Router {
    let dependencies: FavoritesDependencies
    let coordinator: NavigationCoordinator<FavoritesRoute>

    @ViewBuilder
    func rootView() -> some View {
        FavoritesView(coordinator: coordinator)
            .onAppear { dependencies.analytics.track("favorites.root") }
    }

    @ViewBuilder
    func view(for route: FavoritesRoute) -> some View {
        switch route {
        case .bookmarks:
            FavoritesBookmarks()
                .onAppear { dependencies.analytics.track("favorites.bookmarks") }
        case .folders:
            FavoritesFolders()
                .onAppear { dependencies.analytics.track("favorites.folders") }
        case .documentsUnderControl:
            FavoritesDocumentsUnderControl()
                .onAppear { dependencies.analytics.track("favorites.documentsUnderControl") }
        case .uploadedDocuments:
            FavoritesUploadedDocuments()
                .onAppear { dependencies.analytics.track("favorites.uploadedDocuments") }
        }
    }
}
