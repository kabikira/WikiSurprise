//
//  StubHTTPClient.swift
//  WikiSurpriseTests
//
//  Created by koala panda on 2024/08/12.
//

import Foundation
@testable import WikiSurprise

class StubHTTPClient: HTTPClient {
    var data: Data = Data()
    var response: HTTPURLResponse = HTTPURLResponse(
        url: URL(string: "https://example.com")!,
        statusCode: 200,
        httpVersion: nil,
        headerFields: nil)!

    var error: Error?

    func sendRequest(_ urlRequest: URLRequest) async throws -> (Data, HTTPURLResponse) {
        // もしエラーが設定されていれば、エラーをスロー
        if let error = error {
            throw error
        }

        // 0.1秒待機してから、設定されたデータとレスポンスを返す
        try await Task.sleep(nanoseconds: 100_000_000) // 0.1秒 (100ミリ秒)
        return (data, response)
    }
}
