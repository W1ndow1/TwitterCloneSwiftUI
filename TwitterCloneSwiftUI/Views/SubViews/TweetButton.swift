//
//  TweetButton.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/2/23.
//

import SwiftUI

struct TweetButton: View {
    @Binding var direction: Direction
    @Binding var offset: CGFloat
    var body: some View {
        Button {
           print("\(offset)투명도 값입니다.")
        } label: {
            Image(systemName: "plus")
                .frame(width: 60, height: 60)
        }
        .background(Color.twitterButton)
        .foregroundStyle(.white)
        .cornerRadius(30)
        .opacity(changeOpacity(direction, offset))
        .padding(30)
    }
    
    func changeOpacity(_ dirction: Direction, _ offset: CGFloat) -> Double {
        return dirction == .up
        //아래 내용으로 갈땐 투명으로
        ? (offset >= 151.0 ? 1.0 : 0.5)
        //위 내용으로 갈땐 원래대로
        : 1.0
    }
}

