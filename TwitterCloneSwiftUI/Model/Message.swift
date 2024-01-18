//
//  Message.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/2/23.
//

import Foundation

struct Message: Identifiable, Codable {
    let id: Int
    var user: String
    var text: String
}

enum SearchScope: String, CaseIterable {
    case index, favorites
}
