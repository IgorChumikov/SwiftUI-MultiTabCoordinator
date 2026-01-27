//
//  AllDocumentsHistoryView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 27.01.2026.
//

import SwiftUI

struct AllDocumentsHistoryView: View {
    
    let documentTitle: String
    
    var body: some View {
        List(1...20, id: \.self) { index in
            VStack(alignment: .leading, spacing: 4) {
                Text("№\(index): \(documentTitle)")
                    .font(.body)
            }
        }
        .navigationTitle(documentTitle)
    }
}


#Preview {
    AllDocumentsHistoryView(documentTitle: "Договор аренды")
}
