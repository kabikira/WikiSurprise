//
//  WikiRequest.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/10.
//

import Foundation

public protocol WikiRequest {
    associatedtype Response: Decodable
    var baseURL: URL { get }
    // パス"/w/api.php"
    var path: String { get }
    var method: HTTPMethod { get }
    // クエリ "?action=query&list=random&rnnamespace=0&rnlimit=10&format=json"
    var queryItems: [URLQueryItem] { get }
}

public extension WikiRequest {
    var baseURL: URL {
        return URL(string: "https://ja.wikipedia.org")!
    }
}
