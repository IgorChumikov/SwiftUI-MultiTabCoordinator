//
//  HistoryView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var app: TabBarCoordinator
    @ObservedObject var coordinator: NavigationCoordinator<HistoryRoute>
    
    private let documents: [DocumentHistory] = [
        .init(id: "1", title: "Договор аренды"),
        .init(id: "2", title: "Акт приёма-передачи"),
        .init(id: "3", title: "Счёт на оплату")
    ]
    
    var body: some View {
        List(documents) { document in
            Button {
                coordinator.push(.documentDetails(document: document))
            } label: {
                Text(document.title)
            }
        }
        .navigationTitle("Документы")
    }
}

#Preview {
    HistoryView(coordinator: NavigationCoordinator<HistoryRoute>())
}
