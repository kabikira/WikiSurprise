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


final class WikiSurpriseTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }

}
