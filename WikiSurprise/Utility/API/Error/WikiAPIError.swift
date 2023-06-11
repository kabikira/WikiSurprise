//
//  WikiAPIError.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/09.
//

import Foundation
public struct WikiAPIError: Decodable, Error {
    public struct Error: Decodable {
        public var code: String
        public var info: String
        public var documentationURI: String

        enum CodingKeys: String, CodingKey {
            case code, info
            case documentationURI = "*"
        }
    }
    public var errors: [Error]
}
