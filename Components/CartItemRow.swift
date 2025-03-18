//
//  CartItemRow.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct CartItemRow: View {
    let product: Product
    @Binding var quantity: Int
    let onAdd: () -> Void
    let onRemove: () -> Void

    var body: some View {
        HStack {
            Image(systemName: "photo") // Replace with actual image loading
                .resizable()
                .frame(width: 60, height: 60)
                .scaledToFit()
                .cornerRadius(8)

            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.headline)
                    .lineLimit(1)
                Text("$\(String(format: "%.2f", product.price))")
                    .foregroundColor(.blue)
            }

            Spacer()

            HStack(spacing: 10) {
                Button(action: {
                    if quantity > 1 {
                        onRemove()
                    }
                }) {
                    Image(systemName: "minus.circle.fill")
                        .foregroundColor(quantity > 1 ? .red : .gray)
                        .font(.title2)
                        .padding(5)
                }
                .disabled(quantity == 1)

                Text("\(quantity)")
                    .font(.headline)
                    .frame(minWidth: 35, alignment: .center)
                    .padding(.horizontal, 5)
                    .background(RoundedRectangle(cornerRadius: 5).fill(Color.gray.opacity(0.2)))

                Button(action: {
                    onAdd()
                }) {
                    Image(systemName: "plus.circle.fill")
                        .foregroundColor(.green)
                        .font(.title2)
                        .padding(5)
                }
            }
            .padding(.horizontal, 10)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading) // ✅ Flexible display
    }
}

struct CartItemRow_Previews: PreviewProvider {
    static var previews: some View{
        CartItemRow(product: Product(name: "Apple", description: "Fresh Red Apples", price: 1.99, image: "apple", category: .fruits),
                    quantity: .constant(1),
                    onAdd: {},
                    onRemove: {}
)
        .previewLayout(.sizeThatFits)
    }
}
