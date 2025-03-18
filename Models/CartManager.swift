//
//  CartManager.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

class CartManager: ObservableObject {
    @Published var items: [Product: Int] = [:]

    var total: Double {
        items.reduce(0) { $0 + ($1.key.price * Double($1.value)) }
    }

    func addToCart(product: Product) {
        if let quantity = items[product] {
            items[product] = quantity + 1
        } else {
            items[product] = 1
        }
    }

    func decreaseQuantity(product: Product) {
        if let quantity = items[product] {
            if quantity > 1 {
                items[product] = quantity - 1
            } else {
                removeFromCart(product: product) // ✅ If only 1 left, remove completely
            }
        }
    }

    func removeFromCart(product: Product) {
        items.removeValue(forKey: product)
    }
}
