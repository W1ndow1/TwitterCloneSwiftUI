//
//  ToolBarButton.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/6/23.
//

import SwiftUI

func makeProfileToolbarItem() -> some View {
    return NavigationLink(destination: ProfileView(), label: {
        Circle()
            .fill(Color.twitterButton)
            .frame(width: 30, height: 30)
    })
}

func makeSearchSettingToolbarItem(setting: Binding<Bool>) -> some View {
    return Button {
        setting.wrappedValue.toggle()
    } label: {
        Image(systemName: "gearshape")
            .foregroundStyle(
                .linearGradient(colors: [.gray, .blue], startPoint: .topLeading, endPoint: .bottomTrailing))
    }
    .sheet(isPresented: setting){
        SettingView()
            .presentationDetents([.height(300)])
    }
}

func makeHomeSettingToolbarItem(setting: Binding<Bool>) -> some View {
    return Button {
        setting.wrappedValue.toggle()
    } label: {
        Image(systemName: "gearshape")
            .foregroundStyle(.gray)
    }
    .fullScreenCover(isPresented: setting){
        SettingView()
    }
}
