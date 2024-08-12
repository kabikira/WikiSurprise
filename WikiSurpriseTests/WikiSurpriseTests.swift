//
//  WikiSurpriseTests.swift
//  WikiSurpriseTests
//
//  Created by koala panda on 2024/08/09.
//

import XCTest
import Foundation
@testable import WikiSurprise

final class ArticleTests: XCTestCase {
    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = Article.exampleJSON.data(using: .utf8)!
        let article = try jsonDecoder.decode(Article.self, from: data)
        XCTAssertEqual(article.id, 2633600)
        XCTAssertEqual(article.title, "ビナシン")
        XCTAssertEqual(article.urlStr, "https://ja.wikipedia.org/wiki/%E3%83%93%E3%83%8A%E3%82%B7%E3%83%B3")

    }
}

final class WikiResponseTests: XCTestCase {
    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = Query.exampleJSON.data(using: .utf8)!
        let wikiResponse = try jsonDecoder.decode(Query.self, from: data)
        XCTAssertNotNil(wikiResponse,"Failed to decode WikiResponse")
        XCTAssertEqual(wikiResponse.random?.count, 10)
    }
}

final class QueryTests: XCTestCase {
    func testDecode() throws {
        let jsonDecoder = JSONDecoder()
        let data = WikiResponse.exampleJSON.data(using: .utf8)!
        let query = try jsonDecoder.decode(WikiResponse.self, from: data)
        XCTAssertNotNil(query,"Failed to decode WikiResponse")
    }
}

final class WikiAPIErrorTests: XCTestCase {
    func testDecode() throws {
            let jsonDecoder = JSONDecoder()
            let data = WikiAPIError.exampleJSON.data(using: .utf8)!
            let wikiAPIError = try jsonDecoder.decode(WikiAPIError.self, from: data)

            XCTAssertEqual(wikiAPIError.code, "badvalue")
            XCTAssertEqual(wikiAPIError.info, "Unrecognized value for parameter \"action\": .")
            XCTAssertEqual(wikiAPIError.documentationURI, "See https://ja.wikipedia.org/w/api.php for API usage. Subscribe to the mediawiki-api-announce mailing list at <https://lists.wikimedia.org/postorius/lists/mediawiki-api-announce.lists.wikimedia.org/> for notice of API deprecations and breaking changes.")
        }
}

final class WikiClientTests: XCTestCase {
    var httpClient: StubHTTPClient!
    var wikiClient: WikiClient!

    override func setUp() {
        super.setUp()
        httpClient = StubHTTPClient()
        wikiClient = WikiClient(httpClient: httpClient)
    }

    func testSendRequestSuccess() async throws {
        let json = WikiResponse.exampleJSON
        httpClient.data = Data(json.utf8)
        httpClient.response = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                              statusCode: 200,
                                              httpVersion: nil,
                                              headerFields: nil)!
        let request = WikiAPI.GetArticles()
        do {
            let articles = try await wikiClient.send(request: request).query.random ?? []

            XCTAssertEqual(articles[0].id, 3216088)
            XCTAssertEqual(articles[0].title, "ATMOS 2000")
            XCTAssertEqual(articles[0].urlStr, "https://ja.wikipedia.org/wiki/ATMOS%202000")

        } catch {
            XCTFail("Expected URLError, but got \(error)")
        }
    }

    // 通信に失敗した場合
    func testFailureByConnectionError() async throws {
        httpClient.error = URLError(.cannotConnectToHost)
        let json = WikiResponse.exampleJSON
        httpClient.data = Data(json.utf8)
        httpClient.response = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                              statusCode: 200,
                                              httpVersion: nil,
                                              headerFields: nil)!
        let request = WikiAPI.GetArticles()

        do {
            _ = try await wikiClient.send(request: request).query.random ?? []
            XCTFail("Expected to throw, but succeeded")
        } catch let WikiClientError.connectionError(error as URLError) {
            print("エラー\(error)")

            XCTAssertEqual(error.code, .cannotConnectToHost)
        } catch {
            XCTFail("Expected WikiClientError.connectionError, but got \(error)")
        }
    }

    // レスポンスの解釈に失敗した場合
    func testFailureByResponseParseError() async throws {
        let json = "{}"
        httpClient.data = Data(json.utf8)
        httpClient.response = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                              statusCode: 200,
                                              httpVersion: nil,
                                              headerFields: nil)!
        let request = WikiAPI.GetArticles()
        do {
            _ = try await wikiClient.send(request: request).query.random ?? []
            XCTFail("Expected to throw, but succeeded")
        } catch {
            return
        }
    }

    // エラーレスポンスを受け取った場合
    func testFailureByAPIError() async throws {
        let json = WikiAPIError.exampleJSON
        httpClient.data = Data(json.utf8)
        httpClient.response = HTTPURLResponse(url: URL(string: "https://example.com")!,
                                              statusCode: 400,
                                              httpVersion: nil,
                                              headerFields: nil)!
        let request = WikiAPI.GetArticles()
        do {
            let articles = try await wikiClient.send(request: request).query.random ?? []
            XCTFail("Expected to throw, but succeeded")

        } catch let WikiClientError.responseParseError(apiError as WikiAPIError) {
            XCTAssertEqual(apiError.code, "badvalue")
            XCTAssertEqual(apiError.info, "Unrecognized value for parameter \"action\": .")
            XCTAssertEqual(apiError.documentationURI, "See https://ja.wikipedia.org/w/api.php for API usage. Subscribe to the mediawiki-api-announce mailing list at <https://lists.wikimedia.org/postorius/lists/mediawiki-api-announce.lists.wikimedia.org/> for notice of API deprecations and breaking changes.")
        } catch {
            XCTFail("Expected WikiClientError.responseParseError with WikiAPIError, but got \(error)")
        }
    }
}
