//
//  FavoritesView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var app: TabBarCoordinator
    @ObservedObject var coordinator: NavigationCoordinator<FavoritesRoute>
    
    var body: some View {
        List {
            Section("Категории") {
                Button("Закладки") {
                    coordinator.push(.bookmarks)
                }
                Button("Папки") {
                    coordinator.push(.folders)
                }
                Button("Документы на контроле") {
                    coordinator.push(.documentsUnderControl)
                }
                Button("Загруженные документы") {
                    coordinator.push(.uploadedDocuments)
                }
            }
            
            Section("Отладка") {
                Text("Path count: \(coordinator.path.count)")
                    .foregroundStyle(.secondary)
                if coordinator.path.count > 0 {
                    Button("Pop to Root") { coordinator.popToRoot() }
                }
            }
        }
        .navigationTitle("Избранное")
    }
}

#Preview {
    FavoritesView(coordinator: NavigationCoordinator<FavoritesRoute>())
}
