//
//  SignupView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct SignupView: View {
    @EnvironmentObject var authManager: AuthManager
    @State private var email: String = ""
    @State private var password: String = ""
    @State private var confirmPassword: String = ""
    @State private var isSignupSuccess = false
    @Environment(\.presentationMode) var presentationMode

    var body: some View {
        VStack {
            Text("Create an Account")
                .font(.largeTitle)
                .bold()
                .padding(.bottom, 20)

            TextField("Email", text: $email)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding()

            SecureField("Password", text: $password)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            SecureField("Confirm Password", text: $confirmPassword)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()

            Button(action: {
                if password == confirmPassword {
                    authManager.signup(email: email, password: password)
                    isSignupSuccess = true
                }
            }) {
                Text("Sign Up")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(email.isEmpty || password.isEmpty || confirmPassword.isEmpty ? Color.gray : Color.green)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            .disabled(email.isEmpty || password.isEmpty || confirmPassword.isEmpty)

            Button("Already have an account? Log in") {
                presentationMode.wrappedValue.dismiss()
            }
            .padding()
        }
        .padding()
        .alert(isPresented: $isSignupSuccess) {
            Alert(
                title: Text("Signup Successful"),
                message: Text("You can now log in."),
                dismissButton: .default(Text("OK")) {
                    presentationMode.wrappedValue.dismiss()
                }
            )
        }
    }
}

struct SignupView_Previews: PreviewProvider {
    static var previews: some View {
        SignupView().environmentObject(AuthManager())
    }
}
