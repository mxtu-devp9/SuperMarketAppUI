//
//  OrderHistoryView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct OrderHistoryView: View {
    var body: some View {
        VStack {
            Text("No recent orders")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
        }
        .navigationTitle("Order History")
    }
}
