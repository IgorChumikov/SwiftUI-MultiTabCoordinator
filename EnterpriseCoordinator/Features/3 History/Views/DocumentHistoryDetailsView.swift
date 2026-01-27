//
//  DocumentHistoryDetailsView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 27.01.2026.
//

import SwiftUI

struct DocumentHistoryDetailsView: View {
    
    @EnvironmentObject var app: TabBarCoordinator
    @ObservedObject var coordinator: NavigationCoordinator<HistoryRoute>
    let document: DocumentHistory
    
    var body: some View {
        VStack(spacing: 16) {
            Text(document.title)
                .font(.title)
            
            Text("ID документа: \(document.id)")
                .foregroundStyle(.secondary)
            
            Button {
                coordinator.push(.allDocumentsHistoryView(documentTitle: document.title))
                
            } label: {
                Text("Открыть все документы \(document.title)")
            }
        }
        .navigationTitle("История")
    }
}


#Preview {
    DocumentHistoryDetailsView(
        coordinator: NavigationCoordinator<HistoryRoute>(),
        document: DocumentHistory(
            id: "1",
            title: "Договор аренды"
        )
    )
}
