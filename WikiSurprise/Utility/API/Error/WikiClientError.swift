//
//  WikiClientError.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/09.
//

import Foundation

enum WikiClientError: Error {
    case error

    case connectionError(Error)
    
    case responseParseError(Error)
    // APIからエラーレスポンスを受け取った
    case apiError(WikiAPIError)
}


