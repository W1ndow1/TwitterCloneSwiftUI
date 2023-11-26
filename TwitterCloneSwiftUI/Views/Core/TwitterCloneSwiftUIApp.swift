//
//  TwitterCloneSwiftUIApp.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI

@main
struct TwitterCloneSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            TabView {
                HomeView()
                    .tabItem({ Label("", systemImage: "house") })
                SearchView(episode: Episode())
                    .tabItem({ Label("", systemImage: "magnifyingglass") })
                NotificationView()
                    .tabItem({ Label("", systemImage: "bell") })
                DirectMessagesView()
                    .tabItem({ Label("", systemImage: "envelope")})
            }
            .tint(Color.twitterButton)
        }
    }
}
