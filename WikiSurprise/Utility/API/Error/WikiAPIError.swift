//
//  WikiAPIError.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/09.
//

import Foundation
struct WikiAPIError: Decodable, Error {
    var code: String
    var info: String
    var documentationURI: String?

    enum CodingKeys: String, CodingKey {
        case code, info
        case documentationURI = "*"
    }

}
