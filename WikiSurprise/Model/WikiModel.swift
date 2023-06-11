//
//  WikiModel.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import Foundation

public struct Article: Codable {
    let id: Int
    let title: String
    var urlStr: String { "https://ja.wikipedia.org/wiki/" + (title.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed) ?? "")}
}

public struct Query: Codable {
    let random: [Article]?
}

public struct RandomResponse: Codable {
    let query: Query
}
