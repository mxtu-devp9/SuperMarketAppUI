//
//  HelpCenterView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct HelpCenterView: View {
    var body: some View {
        VStack {
            Text("Need Help?")
                .font(.title)
                .bold()
                .padding()

            Text("For any issues, contact us at support@example.com")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()

            Button(action: {
                // Open email or support chat
            }) {
                Text("Contact Support")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }
            .padding()
            
            Spacer()
        }
        .navigationTitle("Help Center")
    }
}
