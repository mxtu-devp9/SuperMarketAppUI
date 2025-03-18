//
//  AuthManager.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

class AuthManager: ObservableObject {
    @AppStorage("hasSeenOnboarding") var hasSeenOnboarding: Bool = false
    @AppStorage("isAuthenticated") var isAuthenticated: Bool = false
    @Published var currentUserEmail: String? = nil

    func login(email: String, password: String) {
        if !email.isEmpty && !password.isEmpty {
            currentUserEmail = email
            isAuthenticated = true
        }
    }

    func signup(email: String, password: String) {
        if !email.isEmpty && !password.isEmpty {
            currentUserEmail = email
            isAuthenticated = true
        }
    }

    func logout() {
        isAuthenticated = false
        currentUserEmail = nil
    }
}
