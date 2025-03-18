//
//  MainTabView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct MainTabView: View {
    @EnvironmentObject var authManager: AuthManager
    @EnvironmentObject var cartManager: CartManager
    @EnvironmentObject var favoritesManager: FavoritesManager

    var body: some View {
        TabView {
            HomeView()
                .tabItem {
                    Image(systemName: "house.fill")
                    Text("Home")
                }

            CartView()
                .environmentObject(cartManager)
                .tabItem {
                    Image(systemName: "cart.fill")
                    Text("Cart")
                }

            FavoritesView()
                .environmentObject(favoritesManager)
                .tabItem {
                    Image(systemName: "heart.fill")
                    Text("Favorites")
                }

            AccountView()
                .tabItem {
                    Image(systemName: "person.fill")
                    Text("Account")
                }
        }
    }
}

struct MainTabView_Previews: PreviewProvider {
    static var previews: some View {
        MainTabView()
            .environmentObject(AuthManager())
            .environmentObject(CartManager())
            .environmentObject(FavoritesManager())
    }
}

