//
//  ArticleTableViewCell.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!
    // ハードコーティングを防ぐため
    static var className: String { String(describing: ArticleTableViewCell.self)}

    override func prepareForReuse() {
        super.prepareForReuse()
        title.text = nil
    }
    func configure(article: Article) {
           self.title.text = article.title
       }
}

