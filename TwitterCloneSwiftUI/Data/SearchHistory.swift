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
    
    init(searchWord: String, startDate: Date = .now) {
        self.word = searchWord
        self.startDate = startDate
    }
    
    func SaveData<T>(a: inout T, b: inout T) -> Int {
        return 0;
    }
}

