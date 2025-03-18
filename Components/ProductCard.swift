//
//  ProductCard.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct ProductCard: View {
    let product: Product

    var body: some View {
        VStack {
            if let uiImage = UIImage(named: product.image) {
                Image(uiImage: uiImage) // ✅ Correct image loading
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .cornerRadius(10)
            } else {
                Image(systemName: "photo") // Fallback image if not found
                    .resizable()
                    .scaledToFit()
                    .frame(height: 120)
                    .foregroundColor(.gray)
            }

            Text(product.name)
                .font(.headline)
                .lineLimit(1)

            Text("$\(product.price, specifier: "%.2f")")
                .foregroundColor(.blue)
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 10).fill(Color.white).shadow(radius: 2))
    }
}

struct ProductCard_Previews: PreviewProvider {
    static var previews: some View {
        ProductCard(product: Product(
            name: "Apple",
            description: "Fresh Red Apple",
            price: 1.99,
            image: "apple", // ✅ Make sure this matches Assets.xcassets
            category: .fruits
        ))
        .previewLayout(.sizeThatFits)
    }
}
