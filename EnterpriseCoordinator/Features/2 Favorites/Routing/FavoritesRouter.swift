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
    }

    @ViewBuilder
    func view(for route: FavoritesRoute) -> some View {
        switch route {
        case .bookmarks:
            FavoritesBookmarks()
        case .folders:
            FavoritesFolders()
        case .documentsUnderControl:
            FavoritesDocumentsUnderControl()
        case .uploadedDocuments:
            FavoritesUploadedDocuments()
        }
    }

    func makeEventHandler() -> (NavigationEvent<FavoritesRoute>) -> Void {
        let analytics = dependencies.analytics
        return { event in
            switch event {
            case .pushed(let route):
                analytics.track("favorites.\(route.analyticsName)")
            case .presentedSheet(let sheet):
                analytics.track("favorites.modal.\(sheet.analyticsName)")
            case .presentedCover(let cover):
                analytics.track("favorites.modal.\(cover.analyticsName)")
            case .popped, .poppedToRoot:
                break
            }
        }
    }
}
