//
//  SettingView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/3/23.
//

import SwiftUI

struct SettingView: View {
    @Environment(\.presentationMode) var presentationMode
    var body: some View {
        
        NavigationStack {
            HStack {
                Spacer()
                VStack {
                    Text("탐색 설정")
                    Text("@Window_1")
                        .font(.system(size: 12))
                        .foregroundStyle(.secondary)
                }
                .padding(.leading, 30)
                Spacer()
                Button{
                    presentationMode.wrappedValue.dismiss()
                } label: {
                    Text("완료")
                        .bold()
                        .font(.system(size: 17))
                        .foregroundStyle(.black)
                }
            }
            .padding([.leading, .trailing], 20)
            
            ScrollView {
                Text("Setting View")
                
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarLeading){
                Text("완료")
                    .foregroundStyle(.white)
            }
        }
    }
}

#Preview {
    SettingView()
}
