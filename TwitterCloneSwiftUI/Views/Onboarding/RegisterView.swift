//
//  RegisterView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/11/23.
//

import SwiftUI


struct RegisterView: View {
    var body: some View {
            VStack {
                GeometryReader { geo in
                    Text("Hello, World!")
                        .frame(width: geo.size.width * 1.0, height: 40)
                        .background(.red)
                    Text("지오메트리 테스트 해보자")
                        .frame(width: geo.size.width * 1.5, height: geo.size.height * 0.1)
                    Button {
                        print("123")
                    } label: {
                        Circle()
                            .frame(width: 80)
                            .position(x: geo.size.width * 0.8, y: geo.size.height * 0.9)
                            
                    }
                }

                Text("More text")
                    .background(.blue)
            }
        }
}

struct RegisterView_Previews: PreviewProvider {
    static var previews: some View {
        RegisterView()
    }
}
