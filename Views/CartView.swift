//
//  CartView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct CartView: View {
    @EnvironmentObject var cartManager: CartManager

    var body: some View {
        NavigationView {
            VStack {
                if cartManager.items.isEmpty {
                    Text("Your cart is empty 🛒")
                        .font(.title2)
                        .padding()
                } else {
                    List {
                        ForEach(cartManager.items.keys.sorted(by: { $0.name < $1.name }), id: \.id) { product in
                            if let quantity = cartManager.items[product] {
                                HStack {
                                    Image(product.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 50, height: 50)
                                        .cornerRadius(8)

                                    VStack(alignment: .leading) {
                                        Text(product.name)
                                            .font(.headline)
                                        Text("$\(product.price, specifier: "%.2f")")
                                            .foregroundColor(.gray)
                                    }
                                    Spacer()

                                    Text("x\(quantity)")
                                        .font(.headline)
                                    
                                    Button(action: {
                                        cartManager.removeFromCart(product: product)
                                    }) {
                                        Image(systemName: "trash.fill")
                                            .foregroundColor(.red)
                                    }
                                }
                            }
                        }
                    }

                    HStack {
                        Text("Total:")
                            .font(.title2)
                        Spacer()
                        Text("$\(String(format: "%.2f", cartManager.total))")
                            .font(.title2)
                            .bold()
                    }
                    .padding()

                    NavigationLink(destination: CheckoutView().environmentObject(cartManager)) {
                        Text("Proceed to Checkout")
                            .frame(maxWidth: .infinity)
                            .padding()
                            .background(Color.blue)
                            .foregroundColor(.white)
                            .cornerRadius(10)
                    }
                    .padding()
                }
            }
            .navigationTitle("Cart")
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView().environmentObject(CartManager())
    }
}
