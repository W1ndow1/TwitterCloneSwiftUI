//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        FloatingButton()
    }
}

struct FloatingButton: View {
    @State private var buttonOpacity: Double = 1.0
    @State private var scrolledOffset: CGFloat = 0.0
    var body: some View {
        ZStack(alignment:.bottomTrailing) {
            ScrollView {
                ScrollViewReader { reader in
                    VStack {
                        ForEach(1..<10) { _ in
                            TweetRowView()
                                .padding()
                        }
                        .id("tweetScrollContent")
                        .onChange(of: scrolledOffset) { offset in
                            withAnimation {
                                buttonOpacity = Double(offset > 100 ? 0 : 1)
                            }
                        }
                    }
                    .onChange(of: buttonOpacity) { opacity in
                        reader.scrollTo("tweetScrollConetne", anchor: .top)
                    }
                }
            }
            Button(action: {
                print("Tweet Button Action")
            }) {
                Image(systemName: "plus")
                    .frame(width: 60, height: 60)
            }
            .background(Color.twitterButton)
            .foregroundColor(.white)
            .opacity(buttonOpacity)
            .cornerRadius(30)
            .padding(30)
        }
    }
}


struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}


