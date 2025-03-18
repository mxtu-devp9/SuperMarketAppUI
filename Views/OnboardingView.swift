//
//  OnboardingView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct OnboardingView: View {
    @EnvironmentObject var authManager: AuthManager //  Inject AuthManager
    @State private var currentPage = 0
    @State private var navigateToLogin = false //  State for navigation

    let pages = [
        ("Welcome to GroceryApp", "Your one-stop shop for all groceries", "basket"),
        ("Fresh Products", "Get fresh products delivered to your doorstep", "leaf"),
        ("Easy Checkout", "Quick and secure checkout process", "cart")
    ]
    
    var body: some View {
        TabView {
            ForEach(pages.indices, id: \.self) { index in
                VStack {
                    Image(systemName: pages[index].2)
                        .resizable()
                        .frame(width: 100, height: 100)
                    
                    Text(pages[index].0)
                        .font(.title)
                        .bold()
    
                    Text(pages[index].1)
                        .multilineTextAlignment(.center)
                        .padding()
                    
                    if index == pages.count - 1 {
                        Button("Get Started") {
                            authManager.hasSeenOnboarding = true
                            navigateToLogin = true
                        }
                        .buttonStyle(.borderedProminent)
                        .padding()
                    }
                }
            }
        }
        .tabViewStyle(PageTabViewStyle())
        .indexViewStyle(PageIndexViewStyle(backgroundDisplayMode: .always))
        .fullScreenCover(isPresented: $navigateToLogin) {
            LoginView().environmentObject(authManager) //  Navigate to Login
        }
    }
}

struct OnboardingView_Previews: PreviewProvider {
    static var previews: some View {
        OnboardingView().environmentObject(AuthManager()) //  Provide AuthManager for Preview
    }
}
