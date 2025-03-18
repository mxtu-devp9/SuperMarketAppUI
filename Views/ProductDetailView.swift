//
//  ProductDetailView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct ProductDetailView: View {
    let product: Product
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoritesManager: FavoritesManager
    @State private var quantity: Int = 1

    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            // Product Image
            Image(product.image) // ✅ Load actual product image from Assets.xcassets
                .resizable()
                .scaledToFit()
                .frame(width: 250, height: 250)
                .cornerRadius(10)
                .shadow(radius: 5)
                .padding()
                .frame(maxWidth: .infinity, alignment: .center)
                
            // Product Name & Favorite Button
            HStack {
                Text(product.name)
                    .font(.title)
                    .bold()

                Spacer()

                Button(action: {
                    favoritesManager.toggleFavorite(product: product)
                }) {
                    Image(systemName: favoritesManager.isFavorite(product: product) ? "heart.fill" : "heart")
                        .foregroundColor(favoritesManager.isFavorite(product: product) ? .red : .gray)
                        .font(.title2)
                }
            }

            // Price
            Text("$\(product.price, specifier: "%.2f")")
                .foregroundColor(.blue)
                .font(.title2)

            // Description
            Text(product.description)
                .font(.body)
                .foregroundColor(.gray)

            // Quantity Controls
            HStack {
                Button(action: {
                    if quantity > 1 {
                        quantity -= 1
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(quantity > 1 ? .red : .gray)
                        .font(.title2)
                }
                .disabled(quantity == 1)

                Text("\(quantity)")
                    .font(.headline)
                    .frame(minWidth: 35, alignment: .center)
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.2)))

                Button(action: {
                    quantity += 1
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                }
            }
            .padding(.vertical)

            // Add to Cart Button
            Button(action: {
                for _ in 1...quantity {
                    cartManager.addToCart(product: product)
                }
            }) {
                HStack {
                    Image(systemName: "cart.badge.plus")
                    Text("Add \(quantity) to Cart")
                }
                .frame(maxWidth: .infinity)
                .padding()
                .background(Color.blue)
                .foregroundColor(.white)
                .cornerRadius(10)
            }
            .padding()

            Spacer()
        }
        .padding()
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(product: Product(
            name: "Apple",
            description: "Fresh Red Apple",
            price: 1.99,
            image: "apple", // ✅ Ensure this matches Assets.xcassets
            category: .fruits
        ))
        .environmentObject(CartManager())
        .environmentObject(FavoritesManager())
    }
}
