//
//  TweetRowView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/30.
//

import SwiftUI

struct TweetRowView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack(alignment: .top, spacing: 10) {
                Circle()
                    .frame(width: 50, height: 50)
                    .foregroundColor(Color.twitterButton)
                VStack(alignment:.leading, spacing: 5) {
                    HStack {
                        Text("ChangwonKim")
                            .font(.subheadline).bold()
                        Text("@W1ndow1")
                            .font(.caption)
                            .foregroundColor(.gray)
                        Text("2주")
                            .foregroundColor(.gray)
                            .font(.caption )
                    }
                    Text("SwiftUI로 만들어 보는 트위터앱입니다. 본문 내용이 많아지면 어떻게 되는지 알아보고 싶습니다. 뭔가 예전 같았으면 계행 문자 같은거 써야 할거 같은데 그런게 아니라면 뭔가 다른 방법이 있겠죠. 우선 이렇게 데이터 넣는걸 해보자")
                        .font(.subheadline)
                        .multilineTextAlignment(.leading)
                    
                }
            }
            //Action Button
            HStack {
                Button {
                    print("Replay Button")
                } label: {
                    Image("replayIcon")
                }
                
                Spacer()
                
                Button {
                    print("Retweet Button")
                } label: {
                    Image("retweetIcon")
                }
                
                Spacer()
                
                Button {
                    print("Heart Button")
                } label: {
                    Image("heartIcon")
                }
                
                Spacer()
                
                Button {
                    print("Share Button")
                } label: {
                    Image("shareIcon")
                }
                
                Spacer()
                
                Button {
                    print("Views Button")
                } label: {
                    Image("viewsIcon")
                }
            }
            .padding()
        }
    }
}

struct TweetCellView_Previews: PreviewProvider {
    static var previews: some View {
        TweetRowView()
    }
}
