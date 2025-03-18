//
//  Product.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct Product: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let description: String
    let price: Double
    let image: String
    let category: Category
}
