//
//  TweetUser.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 2023/11/26.
//

import Foundation

struct TwitterUser {
    let id: String
    var displayName: String
    var userName: String
    var followerCount: Int
    var follingCount: Int
    var createDate: Date
    var bio: String
    var avatarPath: String
    var isUserOnboarded: Bool
    
    init(id: String, displayName: String, userName: String, followerCount: Int, follingCount: Int, createDate: Date, bio: String, avatarPath: String, isUserOnboarded: Bool) {
        self.id = id
        self.displayName = displayName
        self.userName = userName
        self.followerCount = followerCount
        self.follingCount = follingCount
        self.createDate = createDate
        self.bio = bio
        self.avatarPath = avatarPath
        self.isUserOnboarded = isUserOnboarded
    }
}
