//
//  HistoryTab.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HistoryTab: View {
    @EnvironmentObject var app: TabBarCoordinator
    @ObservedObject var coordinator: NavigationCoordinator<HistoryRoute>
    
    var body: some View {
        NavigationStack(path: $coordinator.path) {
            HistoryView(coordinator: coordinator)
                .navigationDestination(for: HistoryRoute.self) { route in
                    coordinator.build(route)
                }
                .sheet(item: $coordinator.localSheet) { sheet in
                    app.buildLocalSheet(sheet)
                }
                .fullScreenCover(item: $coordinator.localCover) { cover in
                    app.buildLocalCover(cover)
                }
        }
    }
}


#Preview {
    HistoryTab(coordinator: NavigationCoordinator<HistoryRoute>())
}
