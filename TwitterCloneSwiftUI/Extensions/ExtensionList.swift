//
//  ExtensionList.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/11/26.
//

import Foundation
import SwiftUI

extension Color {
    ///앱 버튼 색상
    static let twitterButton = Color(red: 0.4627, green: 0.7392, blue: 1.2)
}

extension Timer {
    ///시간을 초로 변경하기
    static func convertSecondToTime(timeInSeconds: Double) -> String {
        let hour = (Int)(fmod((timeInSeconds/3600), 12))
        let minutes = (Int)(fmod((timeInSeconds/60), 60))
        let seconds = (Int)(fmod(timeInSeconds, 60))
        return String(format: "%02d:%02d:%02d", hour, minutes, seconds)
    }
}

///뷰의 투명도 변경
func changeOpacity(_ dirction: Direction, _ offset: CGFloat) -> Double {
    return dirction == .up
    //아래 내용으로 갈땐 투명으로
    ? (offset >= 151.0 ? 1.0 : 0.5)
    //위 내용으로 갈땐 원래대로
    : 1.0
}
