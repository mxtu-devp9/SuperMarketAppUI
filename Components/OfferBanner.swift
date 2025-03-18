import SwiftUI

struct OfferBanner: View {
    let title: String
    let subtitle: String
    let image: String

    var body: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.blue.opacity(0.1))
                .frame(width: 300, height: 120)
                .shadow(radius: 3)

            HStack {
                VStack(alignment: .leading) {
                    Text(title)
                        .font(.headline)
                        .bold()
                        .foregroundColor(.black)
                    
                    Text(subtitle)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                Image(systemName: "gift") // Placeholder icon
                    .resizable()
                    .frame(width: 40, height: 40)
                    .foregroundColor(.blue)
            }
            .padding()
        }
    }
}

struct OfferBanner_Previews: PreviewProvider {
    static var previews: some View {
        OfferBanner(title: "Super Sale!", subtitle: "Up to 50% off on selected items", image: "sale")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
//
//  OfferBanner.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import Foundation
