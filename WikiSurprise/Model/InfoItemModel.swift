//
//  InfoItemModel.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/16.
//

import Foundation


struct InfoItem {
    let emoji: String
    let title: String
}

let infoItems: [InfoItem] = [
    InfoItem(emoji: "👀", title: "アプリの説明"),
    InfoItem(emoji: "✉️", title: "お問い合わせ"),
    InfoItem(emoji: "📝", title: "プライバシーポリシー"),
    InfoItem(emoji: "📱", title: "バージョン Ver1.1")
]
