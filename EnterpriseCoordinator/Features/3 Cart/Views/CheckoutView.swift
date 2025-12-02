//
//  CheckoutView.swift
//  EnterpriseCoordinator
//
//  Created by Игорь Чумиков on 02.12.2025.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var app: AppCoordinator
    
    var body: some View {
        VStack(spacing: 20) {
            Text("💳 Оформление заказа")
                .font(.title)
            
            Button("Подтвердить заказ") {
                app.cart.push(.orderConfirmed(id: "12345"))
            }
            .buttonStyle(.borderedProminent)
        }
        .navigationTitle("Оформление")
    }
}
