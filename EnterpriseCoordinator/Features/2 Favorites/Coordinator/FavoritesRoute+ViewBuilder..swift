//
//  FavoritesRoute+ViewBuilder..swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

extension NavigationCoordinator where RouteType == FavoritesRoute {
    @ViewBuilder
    func build(_ route: FavoritesRoute) -> some View {
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
}
