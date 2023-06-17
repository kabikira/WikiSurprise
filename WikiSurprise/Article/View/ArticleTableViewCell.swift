//
//  ArticleTableViewCell.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {

    @IBOutlet private weak var titleLabel: UILabel!
    // ハードコーティングを防ぐため
    static var className: String { String(describing: ArticleTableViewCell.self)}

    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = nil
    }
   func configure(article: Article) {
           self.titleLabel.text = article.title
       }
}

