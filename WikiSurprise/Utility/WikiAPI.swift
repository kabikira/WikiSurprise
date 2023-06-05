//
//  WikiAPI.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import Foundation

enum WikiError: Error {
    case error
}

final class WikiAPI {
    static let shared = WikiAPI()

    private init() {}

    func getArticle(completion: ((Result<[Article], WikiError>) -> Void)? = nil) {

        let url: URL = URL(string: "https://ja.wikipedia.org/w/api.php?action=query&list=random&rnnamespace=0&rnlimit=10&format=json")!
        let task: URLSessionDataTask = URLSession.shared.dataTask(with: url, completionHandler: {(data, response, error) in
            guard let data = data,
                  let randomResponse = try? JSONDecoder().decode(RandomResponse.self, from: data),
                  let models = randomResponse.query.random else {
                completion?(.failure(.error))
                return
            }
            completion?(.success(models))

        })
        task.resume()
    }
}
