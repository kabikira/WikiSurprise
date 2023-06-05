//
//  WikiModel.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import Foundation

struct Article: Codable {
    let id: Int
    let title: String
}

struct Query: Codable {
    let random: [Article]?
}

struct RandomResponse: Codable {
    let query: Query
}
