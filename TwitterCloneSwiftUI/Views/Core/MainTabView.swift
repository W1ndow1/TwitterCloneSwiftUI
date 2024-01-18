//
//  MainTabView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/10/23.
//

import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            HomeView()
                .tabItem({ Label("", systemImage: "house") })
            SearchView()
                .tabItem({ Label("", systemImage: "magnifyingglass") })
            NotificationView()
                .tabItem({ Label("", systemImage: "bell") })
            DirectMessagesView()
                .tabItem({ Label("", systemImage: "envelope")})
        }
        .tint(Color.twitterButton)
    }
}

#Preview {
    MainTabView()
}
