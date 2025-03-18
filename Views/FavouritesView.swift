//
//  FavouritesView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct FavoritesView: View {
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        NavigationView {
            VStack {
                if favoritesManager.favorites.isEmpty {
                    Text("No favorite items yet !!!")
                        .font(.title2)
                        .padding()
                } else {
                    List {
                        ForEach(favoritesManager.favorites, id: \.id) { product in
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

                                Button(action: {
                                    favoritesManager.toggleFavorite(product: product)
                                }) {
                                    Image(systemName: "heart.fill")
                                        .foregroundColor(.red)
                                }
                            }
                        }
                        .onDelete { indexSet in
                            favoritesManager.favorites.remove(atOffsets: indexSet)
                        }
                    }
                }
            }
            .navigationTitle("Favorites")
        }
    }
}

struct FavoritesView_Previews: PreviewProvider {
    static var previews: some View {
        FavoritesView().environmentObject(FavoritesManager())
    }
}
