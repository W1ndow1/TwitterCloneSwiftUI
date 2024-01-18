//
//  LoginView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/11/23.
//

import SwiftUI

struct LoginView: View {
    var body: some View {
        VStack {
            Text("Top View")
                .padding()
            
            GeometryReader { geometry in
                HStack {
                    Text("Left View")
                        .frame(width: geometry.size.width * 0.4)
                        .padding()
                    
                    Spacer()
                    
                    Text("Right View")
                        .frame(width: geometry.size.width * 0.4)
                        .padding()
                }
            }
            
            Text("Bottom View")
                .padding()
        }
        .padding()
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
