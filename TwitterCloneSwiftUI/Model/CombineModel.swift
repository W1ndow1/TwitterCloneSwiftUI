//
//  CombineModel.swift
//  TwitterCloneSwiftUI
//
//  Created by window1 on 12/14/23.
//

import Foundation

struct User: Codable {
    let userId, id: Int
    let title, body: String
}

struct Todo: Codable, Identifiable {
    let userId, id: Int
    let title: String
    let completed: Bool
}

