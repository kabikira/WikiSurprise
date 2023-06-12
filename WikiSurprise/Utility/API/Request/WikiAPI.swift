//
//  WikiAPI.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import Foundation

public final class WikiAPI {
    public struct GetArticles: WikiRequest {

        public typealias Response = RandomResponse

        public var path: String {
            return "/w/api.php"
        }

        public var method: HTTPMethod {
            return .get
        }

        public var queryItems: [URLQueryItem] {
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
