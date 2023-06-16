//
//  InfoViewCell.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/16.
//

import Foundation
import UIKit

final class InfoViewCell: UITableViewCell {


    @IBOutlet private weak var emojiLabel: UILabel!
    @IBOutlet private weak var titleLabel: UILabel!
    static var className: String { String(describing: InfoViewCell.self)}

    override func prepareForReuse() {
        super.prepareForReuse()
        emojiLabel.text = nil
        titleLabel.text = nil

    }

    func configure(infoItem: InfoItem) {
        self.emojiLabel.text = infoItem.emoji
        self.titleLabel.text = infoItem.title
    }


}
