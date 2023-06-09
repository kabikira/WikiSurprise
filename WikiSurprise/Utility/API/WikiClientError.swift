//
//  WikiClientError.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/09.
//

import Foundation

public enum WikiClientError: Error {
    case error
    // 通信に失敗
    case connectionError(Error)
    // レスポンスの解釈に失敗
    case responseParseError(Error)
    // APIからエラーレスポンスを受け取った
//    case apiError(WikiAPIError)
}
