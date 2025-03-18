//
//  FavoritesManager.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

class FavoritesManager: ObservableObject {
    @Published var favorites: [Product] = []

    func toggleFavorite(product: Product) {
        if let index = favorites.firstIndex(where: { $0.id == product.id }) {
            favorites.remove(at: index)
        } else {
            favorites.append(product)
        }
    }

    func isFavorite(product: Product) -> Bool {
        return favorites.contains(where: { $0.id == product.id })
    }
}
