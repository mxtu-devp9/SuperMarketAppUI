//
//  CheckoutView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct CheckoutView: View {
    @EnvironmentObject var cartManager: CartManager
    @State private var navigateToThankYou = false

    var body: some View {
        VStack(spacing: 20) {
            Text("Order Summary")
                .font(.title2)
                .bold()

            List {
                ForEach(Array(cartManager.items.keys), id: \.id) { product in
                    HStack {
                        Text(product.name)
                        Spacer()
                        Text("\(cartManager.items[product] ?? 0)x")
                        Text("$\(product.price * Double(cartManager.items[product] ?? 0), specifier: "%.2f")")
                    }
                }
            }

            Divider()

            HStack {
                Text("Total:")
                    .font(.headline)
                Spacer()
                Text("$\(cartManager.total, specifier: "%.2f")")
                    .font(.headline)
            }
            .padding()

            Button(action: {
                cartManager.items.removeAll() // ✅ Clear cart after placing order
                navigateToThankYou = true
            }) {
                Text("Place Order")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .fullScreenCover(isPresented: $navigateToThankYou) {
                ThankYouView()
            }
        }
        .navigationTitle("Checkout")
    }
}

struct CheckoutView_Previews: PreviewProvider {
    static var previews: some View {
        CheckoutView().environmentObject(CartManager())
    }
}
