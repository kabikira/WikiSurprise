//
//  ArticleTableViewCell.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit

final class ArticleTableViewCell: UITableViewCell {
    @IBOutlet private weak var title: UILabel!

    override func prepareForReuse() {
        title.text = nil
    }

   

}

