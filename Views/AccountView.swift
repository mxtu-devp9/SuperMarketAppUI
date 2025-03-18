//
//  AccountView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 03/03/25.
//

import SwiftUI

struct AccountView: View {
    @EnvironmentObject var authManager: AuthManager

    var body: some View {
        NavigationView {
            List {
                //  Account Settings Section
                Section(header: Text("Account Settings")) {
                    NavigationLink(destination: ProfileView()) {
                        Label("Profile", systemImage: "person.crop.circle")
                    }

                    NavigationLink(destination: SettingsView()) {
                        Label("App Settings", systemImage: "gearshape")
                    }
                }

                //  Orders & Payments Section
                Section(header: Text("Orders & Payments")) {
                    NavigationLink(destination: OrderHistoryView()) {
                        Label("Order History", systemImage: "list.bullet.rectangle")
                    }

                    NavigationLink(destination:  PaymentMethodsView()) {
                        Label("Payment Methods", systemImage: "creditcard")
                    }
                }

                //  Support & Help Section
                Section(header: Text("Support & Help")) {
                    NavigationLink(destination: HelpCenterView()) {
                        Label("Help Center", systemImage: "questionmark.circle")
                    }

                    NavigationLink(destination: ContactUsView()) {
                        Label("Contact Us", systemImage: "phone.fill")
                    }
                }

                //  Notifications
                Section(header: Text("Notifications")) {
                    NavigationLink(destination: NotificationsView()) {
                        Label("Notification Settings", systemImage: "bell.fill")
                    }
                }

                //  Logout Button
                Section {
                    Button(action: {
                        authManager.logout()
                    }) {
                        HStack {
                            Label("Logout", systemImage: "arrow.backward.circle")
                                .foregroundColor(.red)
                        }
                    }
                }
            }
            .navigationTitle("My Account")
        }
    }
}

struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView().environmentObject(AuthManager())
    }
}

