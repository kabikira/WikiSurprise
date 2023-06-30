//
//  HTTPClient.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/11.
//

import Foundation

protocol HTTPClient {
    func sendRequest(_ urlRequest: URLRequest) async throws -> (Data, HTTPURLResponse)
}

extension URLSession: HTTPClient {
    func sendRequest(_ urlRequest: URLRequest) async throws -> (Data, HTTPURLResponse) {
        let (data, response) = try await URLSession.shared.data(for: urlRequest)
        guard let httpURLResponse = response as? HTTPURLResponse else {
            throw URLError(.badServerResponse)
        }
        return (data, httpURLResponse)
    }
}
