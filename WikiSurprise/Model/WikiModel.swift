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
    var urlStr: String { "https://ja.wikipedia.org/wiki/" + (title.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")}
}

struct Query: Codable {
    let random: [Article]?
}

struct WikiResponse: Codable {
    let query: Query
}
