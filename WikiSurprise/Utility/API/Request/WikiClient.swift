//
//  WikiClient.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/11.
//

import Foundation

public class WikiClient {
    private let httpClient: HTTPClient
    public init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    public func send<Request: WikiRequest>(request: Request,
        completion: @escaping(Result<Request.Response, WikiClientError>) -> Void) {
        let urlRequest = request.buildURLRequest()
        // TableViewでデータを表示する際は、このクロージャで受け取った結果を利用してTableViewを更新します。
            httpClient.sendRequest(urlRequest) { result in
                switch result {
                case .success((let data, let urlResponse)):
                    do {
                        let response = try request.response(from: data, urlResponse: urlResponse)
                        completion(Result.success(response))
                    } catch let error as WikiAPIError {
                        completion(Result.failure(.responseParseError(error)))
                    } catch {
                        completion(Result.failure(.responseParseError((error))))
                    }
                case .failure(let error):
                    completion(.failure(.connectionError(error)))
                }

            }
        }
}
