//
//  NotificationView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI

struct NotificationView: View {
    var body: some View {
        VStack {
            Image(systemName: "bell")
                .imageScale(.large)
                .foregroundColor(.accentColor)
            Text("NotificationView")
        }
        .padding()
    }
}

struct NotificationView_Previews: PreviewProvider {
    static var previews: some View {
        NotificationView()
    }
}
