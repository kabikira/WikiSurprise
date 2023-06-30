//
//  WikiAPI.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import Foundation

final class WikiAPI {
    struct GetArticles: WikiRequest {

        typealias Response = RandomResponse

        var path: String {
            return "/w/api.php"
        }

        var method: HTTPMethod {
            return .get
        }

        var queryItems: [URLQueryItem] {
            return [
                URLQueryItem(name: "action", value: "query"),
                URLQueryItem(name: "list", value: "random"),
                URLQueryItem(name: "rnnamespace", value: "0"),
                URLQueryItem(name: "rnlimit", value: "10"),
                URLQueryItem(name: "format", value: "json")
            ]
        }


    }
}
