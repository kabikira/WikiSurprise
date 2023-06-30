//
//  WikiClient.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/11.
//

import Foundation


class WikiClient {
    private let httpClient: HTTPClient

    init(httpClient: HTTPClient) {
        self.httpClient = httpClient
    }

    func send<Request: WikiRequest>(request: Request) async throws -> Request.Response {
        let urlRequest = request.buildURLRequest()
        do {
            let (data, urlResponse) = try await httpClient.sendRequest(urlRequest)
            let response = try request.response(from: data, urlResponse: urlResponse)
            return response
        } catch let error as WikiAPIError {
            throw WikiClientError.responseParseError(error)
        } catch {
            throw WikiClientError.connectionError(error)
        }
    }
}

