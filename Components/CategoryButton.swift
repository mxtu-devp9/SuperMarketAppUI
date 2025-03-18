//
//  CategoryButton.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import Foundation

import SwiftUI

struct CategoryButton: View {
    let category: Category
    let isSelected: Bool
    let action: () -> Void

    var body: some View {
        Button(action: action) {
            Text(category.rawValue)
                .padding(.horizontal, 20)
                .padding(.vertical, 10)
                .background(isSelected ? Color.blue : Color.gray.opacity(0.2))
                .foregroundColor(isSelected ? .white : .primary)
                .cornerRadius(20)
        }
    }
}

struct CategoryButton_Previews: PreviewProvider {
    static var previews: some View {
        CategoryButton(category: .fruits, isSelected: true, action: {})
            .previewLayout(.sizeThatFits)
    }
}
