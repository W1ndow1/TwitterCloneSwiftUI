//
//  ScrollPositionViewModel.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/9/23.
//

import Foundation

enum Direction: Int {
    case stop = 0
    case up = 1
    case down = 2
}

final class ScrollPositionViewModel: ObservableObject {
    @Published var offset: CGFloat = 0
    @Published var direction: Direction = .stop
    var originOffset: CGFloat = 0
    var isCheckedOriginOffset: Bool = false
    
    func setOriginOffset(_ offset: CGFloat) {
        guard !isCheckedOriginOffset else { return }
        self.originOffset = offset
        self.offset = offset
        isCheckedOriginOffset = true
    }
    
    func setOffset(_ offset: CGFloat) {
        guard isCheckedOriginOffset else { return }
        if self.offset < offset {
            direction = .down
        } else if self.offset > offset {
            direction = .up
        } else {
            direction = .stop
        }
        self.offset = offset
    }
    
}
