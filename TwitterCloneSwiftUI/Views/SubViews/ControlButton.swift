//
//  ControlButton.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/11/23.
//

import SwiftUI

struct ControlButton: View {
    @Binding var isplaying: Bool
    var body: some View{
        HStack {
            Button(action: {
                print("Backword")
            }, label: {
                Image(systemName: "backward.circle")
                    .imageScale(.large)
                    .font(.system(size: 35))
            })
            Button(action: {
                //self.isplaying.toggle()
                withAnimation { self.isplaying.toggle() }
            }) {
                Image(systemName: isplaying ? "play.circle" : "pause.circle")
                    .imageScale(.large)
                    .font(.system(size: 35))
            }
            Button(action: {
                print("Forword")
            }, label: {
                Image(systemName: "forward.circle")
                    .imageScale(.large)
                    .font(.system(size: 35))
            })
        }
        .padding(5)
    }
}


struct ControlButton_Previews: PreviewProvider {
    static var previews: some View {
        ControlButton(isplaying: .constant(false))
    }
}
