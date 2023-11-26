//
//  DirectMessagesView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI

struct DirectMessagesView: View {
    var body: some View {
        VStack{
            Image(systemName: "message")
                .imageScale(.large)
                .foregroundColor(.blue)
            Text("DirectMessageView")
        }
        .padding()
    }
}

struct DirectMessagesView_Previews: PreviewProvider {
    static var previews: some View {
        DirectMessagesView()
    }
}
