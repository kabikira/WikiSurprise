//
//  WikiAPIError.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/09.
//

import Foundation
struct WikiAPIError: Decodable, Error {
    struct Error: Decodable {
         var code: String
         var info: String
         var documentationURI: String

        enum CodingKeys: String, CodingKey {
            case code, info
            case documentationURI = "*"
        }
    }
     var errors: [Error]
}
