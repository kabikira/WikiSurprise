//
//  WikiAPI.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import Foundation



//final class WikiAPI {
//    static let shared = WikiAPI()
//
//    private init() {}
//
//    func getArticle(completion: ((Result<[Article], WikiError>) -> Void)? = nil) {
//
//        let url: URL = URL(string: "https://ja.wikipedia.org/w/api.php?action=query&list=random&rnnamespace=0&rnlimit=10&format=json")!
//        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
//            let response = response as! HTTPURLResponse
//            if response.statusCode == 200 {
//                print(response.statusCode)
//            }
//            guard let data = data,
//                  let randomResponse = try? JSONDecoder().decode(RandomResponse.self, from: data),
//                  let models = randomResponse.query.random else {
//                completion?(.failure(.error))
//                return
//            }
//            completion?(.success(models))
//
//        })
//        task.resume()
//    }
//}

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
