//
//  SampleData.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 1/16/24.
//

import Foundation

struct SampleHistroy {
    var word: String
    var startDate: String
}
struct SampleData {
    var contents: [SampleHistroy] = [
        SampleHistroy(word: "1번", startDate: "2024-01-01 14:22:33"),
        SampleHistroy(word: "2번", startDate: "2024-01-02 14:22:33"),
        SampleHistroy(word: "3번", startDate: "2024-01-03 14:22:33"),
        SampleHistroy(word: "4번", startDate: "2024-01-04 14:22:33")
    ]
}

extension String {
    static func toDate(_ date: String) -> Date {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateFormatter.timeZone = TimeZone(identifier: "UTC")
        guard let date = dateFormatter.date(from: date) else {
            return Date.now
        }
        return date
    }
}
