//
//  SettingsView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct SettingsView: View {
    var body: some View {
        Form {
            Toggle("Enable Dark Mode", isOn: .constant(false))
            Toggle("Push Notifications", isOn: .constant(true))
            Button("Privacy Policy") {}
            Button("Terms & Conditions") {}
        }
        .navigationTitle("Settings")
    }
}
