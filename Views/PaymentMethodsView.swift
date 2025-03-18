//
//  PaymentMethodsView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct PaymentMethodsView: View {
    var body: some View {
        List {
            Text("Credit Card 💳")
            Text("Debit Card 💳")
            Text("UPI / Google Pay")
            Text("PayPal")
            Text("Cash on Delivery")
        }
        .navigationTitle("Payment Methods")
    }
}
