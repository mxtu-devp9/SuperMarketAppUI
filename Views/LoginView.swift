//
//  LoginView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var showSignup = false

    var body: some View {
        VStack {
            Text("Login to GroceryApp")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)

            
            //  Ensure TextFields are interactive
            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                authManager.login(email: email, password: password)
            }) {
                Text("Login")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(email.isEmpty || password.isEmpty ? Color.gray : Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(email.isEmpty || password.isEmpty)

            Button("Don't have an account? Sign Up") {
                showSignup = true
            }
            .padding()
            .sheet(isPresented: $showSignup) {
                SignupView().environmentObject(authManager)
            }
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView().environmentObject(AuthManager())
    }
}
