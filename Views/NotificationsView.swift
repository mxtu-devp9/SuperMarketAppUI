//
//  NotificationsView.swift
//  SuperMarketAppUI
//
//  Created by Miten Mistry on 04/03/25.
//

import SwiftUI

struct NotificationsView: View {
    var body: some View {
        VStack {
            Text("No new notifications")
                .font(.title2)
                .foregroundColor(.gray)
                .padding()
        }
        .navigationTitle("Notifications")
    }
}
