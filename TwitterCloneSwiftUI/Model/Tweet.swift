//
//  Tweet.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/11/26.
//

import Foundation

struct Tweet: Codable, Identifiable {
    var id = UUID().uuidString
    let author: String
    let authorID: String
    let tweetContent: String
    var likesCount: Int
    var likers: [String]
    let isReplay: Bool
    let parentReference: String?
}
