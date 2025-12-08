//
//  ProfileTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct ProfileTab: View {
    @EnvironmentObject var app: TabBarCoordinator
    @ObservedObject var coordinator: NavigationCoordinator<ProfileRoute>
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            ProfileView(coordinator: coordinator)
                .navigationDestination(for: ProfileRoute.self) { route in
                    coordinator.build(route)
                }
                .sheet(item: $coordinator.localSheet) { sheet in
                    app.buildLocalSheet(sheet)
                }
                .fullScreenCover(item: $coordinator.localCover) { cover in
                    app.buildLocalCover(cover)
                }        }
    }
}
