//
//  HistoryTableViewCell.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit

final class HistoryTableViewCell: UITableViewCell {

    @IBOutlet private weak var histryTitle: UILabel!

    // ハードコーティングを防ぐため
    static var className: String { String(describing: HistoryTableViewCell.self)}

    override func prepareForReuse() {
        super.prepareForReuse()
        histryTitle.text = nil
    }


}
