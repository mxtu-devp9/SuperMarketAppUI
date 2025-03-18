//
//  ProfileView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        VStack {
            Image(systemName: "person.crop.circle.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
                .foregroundColor(.blue)
                .padding()

            Text("John Doe") // ✅ Replace with real user data
                .font(.title)
                .bold()
            
            Text("johndoe@example.com") // ✅ Replace with real email
                .foregroundColor(.gray)

            Spacer()
        }
        .navigationTitle("Profile")
        .padding()
    }
}
