//
//  QuickView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct QuickView: View {
    let productId: String
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        VStack(spacing: 20) {
            Text("👁️ Quick View")
                .font(.title)
            Text("Товар: \(productId)")
            
            Button("Закрыть") {
                dismiss()
            }
            .buttonStyle(.borderedProminent)
        }
        .padding()
    }
}
