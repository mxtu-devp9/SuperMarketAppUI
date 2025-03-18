//
//  ContactUsView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct ContactUsView: View {
    let supportEmail = "support@example.com"
    let supportPhone = "+1-800-123-4567"
    let faqURL = URL(string: "https://www.example.com/faq")!

    var body: some View {
        NavigationView {
            List {
                //  Contact Options
                Section(header: Text("Contact Support")) {
                    // 📩 Email Support
                    Button(action: {
                        sendEmail()
                    }) {
                        Label("Email Us", systemImage: "envelope.fill")
                    }

                    //  Phone Support
                    Button(action: {
                        callSupport()
                    }) {
                        Label("Call Support", systemImage: "phone.fill")
                    }

                    // 💬 Live Chat
                    NavigationLink(destination: LiveChatView()) {
                        Label("Live Chat", systemImage: "message.fill")
                    }
                }

                //  FAQ Section
                Section(header: Text("Help & FAQ")) {
                    Link(destination: faqURL) {
                        Label("Visit FAQ Page", systemImage: "questionmark.circle.fill")
                    }
                }
            }
            .navigationTitle("Contact Us")
        }
    }

    // Function to open email
    func sendEmail() {
        if let url = URL(string: "mailto:\(supportEmail)") {
            UIApplication.shared.open(url)
        }
    }

    // Function to call support
    func callSupport() {
        if let url = URL(string: "tel:\(supportPhone)") {
            UIApplication.shared.open(url)
        }
    }
}

//  Live Chat View 
struct LiveChatView: View {
    var body: some View {
        VStack {
            Text("Live Chat Support")
                .font(.title)
                .bold()
                .padding()

            Text("Chat with a support agent for help.")
                .foregroundColor(.gray)
                .multilineTextAlignment(.center)
                .padding()

            Spacer()
        }
        .navigationTitle("Live Chat")
    }
}

struct ContactUsView_Previews: PreviewProvider {
    static var previews: some View {
        ContactUsView()
    }
}
