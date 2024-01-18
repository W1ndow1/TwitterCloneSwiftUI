//
//  SearchHistoryData.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 1/13/24.
//

import Foundation
import SwiftData
import SwiftUI

@Model final
class SearchHistory {
    var word: String
    var startDate: Date
    
    init(word: String = "", startDate: Date = .now) {
        self.word = word
        self.startDate = startDate
    }
}

