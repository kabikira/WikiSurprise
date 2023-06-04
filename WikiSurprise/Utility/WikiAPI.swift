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
    
}
