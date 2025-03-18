//
//  SuperMarketAppUIApp.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

@main
struct SuperarketApp: App {
    @StateObject var authManager = AuthManager()
    @StateObject var cartManager = CartManager()
    @StateObject var favoritesManager = FavoritesManager() // ✅ Add FavoritesManager

    var body: some Scene {
        WindowGroup {
            if authManager.isAuthenticated {
                MainTabView()
                    .environmentObject(authManager)
                    .environmentObject(cartManager)
                    .environmentObject(favoritesManager) // ✅ Add environment object
            } else if authManager.hasSeenOnboarding {
                LoginView()
                    .environmentObject(authManager)
            } else {
                OnboardingView()
                    .environmentObject(authManager)
            }
        }
    }
}
 
