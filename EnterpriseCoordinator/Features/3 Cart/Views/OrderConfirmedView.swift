//
//  OrderConfirmedView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct OrderConfirmedView: View {
    let id: String
    
    var body: some View {
        VStack(spacing: 20) {
            Text("✅")
                .font(.system(size: 80))
            Text("Заказ \(id) подтверждён!")
                .font(.title)
        }
        .navigationTitle("Успех")
    }
}
