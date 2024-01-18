//
//  ContentView.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/10/26.
//

import SwiftUI

struct HomeView: View {
    @StateObject private var scrollPositionViewModel = ScrollPositionViewModel()
    @State private var showingSetting: Bool = false
    var body: some View {
        ScrollViewReader { scrollViewProxy in
            ZStack(alignment:.bottomTrailing) {
                NavigationStack {
                    //HeaderView(offset: $scrollPositionViewModel.offset, direction: $scrollPositionViewModel.direction)
                    ScrollView {
                        scrollObservableView
                        VStack {
                            ForEach(1..<10) { _ in
                                TweetRowView()
                                    .padding()
                            }
                        }
                    }
                    .toolbar {
                        ToolbarItem(placement: .topBarLeading){
                            makeProfileToolbarItem()
                        }
                        ToolbarItem(placement: .topBarTrailing){
                            makeSearchSettingToolbarItem(setting: $showingSetting)
                        }
                    }
                    .onPreferenceChange(ScrollOffsetKey.self){
                        scrollPositionViewModel.setOffset($0)
                    }
                    .background(
                        GeometryReader { proxy in
                            Color.clear.onAppear {
                                print("height:\(proxy.size.height), width:\(proxy.size.width)")
                            }
                        }
                    )
                }
                TweetButton(direction: $scrollPositionViewModel.direction, offset: $scrollPositionViewModel.offset)
            }
        }
    }
    
    //옵저빙 뷰
    //TODO: - 사용방식에 맞게 커스텀해보기
    private var scrollObservableView: some View {
        GeometryReader { proxy in
            let offsetY = proxy.frame(in: .global).origin.y
            Color.clear
                .preference(
                    key: ScrollOffsetKey.self,
                    value: offsetY
                )
                .onAppear {
                    scrollPositionViewModel.setOriginOffset(offsetY)
                }
        }
        .frame(height: 0)
    }
}

//헤더뷰
struct HeaderView: View {
    @Binding var offset: CGFloat
    @Binding var direction: Direction
    var body: some View {
        ZStack {
            VStack {
                Text("\(offset)")
                Text("\(direction.rawValue == 1 ? "up" : "down")")
            }
        }
    }
}


struct ScrollOffsetKey: PreferenceKey {
    static var defaultValue: CGFloat = .zero
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value += nextValue()
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
