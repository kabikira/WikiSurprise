//
//  HistoryTableViewCell.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var histryTitle: UILabel!

    override func prepareForReuse() {
        super.prepareForReuse()
        histryTitle.text = nil
    }
}
