//
//  UserDefaults+.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import Foundation

extension UserDefaults {
    private var loginedKey: String { "logined" }
    var isLogined: Bool {
        set {
            setValue(newValue, forKey: loginedKey)
        }
        get {
            bool(forKey: loginedKey)
        }
    }
}
