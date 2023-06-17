//
//  WikiRequest.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/10.
//


import Foundation
// リクエストとして必要なものをまとめるプロトコル
protocol WikiRequest {
    associatedtype Response: Decodable
    var baseURL: URL { get }
    // パス"/w/api.php"
    var path: String { get }
    var method: HTTPMethod { get }
    // クエリ "?action=query&list=random&rnnamespace=0&rnlimit=10&format=json"
    var queryItems: [URLQueryItem] { get }
}

extension WikiRequest {
    var baseURL: URL {
        return URL(string: "https://ja.wikipedia.org")!
    }
    func buildURLRequest() -> URLRequest {
        let url = baseURL.appendingPathComponent(path)
        var components = URLComponents(url: url, resolvingAgainstBaseURL: true)

        switch method {
            // 今回は.get以外のHTTPメソッドは考慮しない
        case .get:
            components?.queryItems = queryItems
        default:
            fatalError("Unsupprted method \(method)")
        }

        var urlRequest = URLRequest(url: url)
        urlRequest.url = components?.url
        urlRequest.httpMethod = method.rawValue

        // リファレンスによるとデフォルトで60秒に設定されているようなので60秒で指定しても意味がないかもしれない
        urlRequest.timeoutInterval = 60

        return urlRequest
    }

    func response(from data: Data, urlResponse: HTTPURLResponse) throws -> Response {
        let decoder = JSONDecoder()

        if (200..<300).contains(urlResponse.statusCode) {
            // JSONからモデルをインスタンス化
            return try decoder.decode(Response.self, from: data)
        } else {
            // JSONからAPIエラーをインスタンス化
            throw try decoder.decode(WikiAPIError.self, from: data)
        }
    }
}
