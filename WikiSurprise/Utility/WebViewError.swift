//
//  WebViewError.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/11.
//

import Foundation

public enum WebViewError: Error {
    case error
    case connectionError
    case pageLoadError
    case urlErrorMessage
}

extension WebViewError: CustomStringConvertible {
    public var description: String {
        switch self {
        case .error:
            return "エラーです｡"
        case .connectionError:
            return "ネットワークに接続できません｡"
        case .pageLoadError:
            return "ページの読み込みに失敗しました｡"
        case .urlErrorMessage:
            return "無効のURLです｡"
        }
    }
}
