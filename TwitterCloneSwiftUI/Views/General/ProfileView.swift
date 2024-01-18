//
//  ProfileView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/2/23.
//

import SwiftUI

struct ProfileView: View {
    var body: some View {
        NavigationView {
            ZStack(alignment: .topLeading) {
                VStack {
                    Image("profileHeader")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .ignoresSafeArea()
                    ScrollView {
                        ForEach(1..<10){ _ in
                            TweetRowView()
                                .padding()
                        }
                    }
                }
                
                Image("profileSample")
                    .resizable()
                    .frame(width: 80, height: 80)
                    .clipShape(Circle())
                    .overlay {
                        Circle().stroke(.background, lineWidth: 4)
                    }
                    .position(CGPoint(x: 50, y: 210))
                
            }
        }
    }
}


#Preview {
    ProfileView()
}
