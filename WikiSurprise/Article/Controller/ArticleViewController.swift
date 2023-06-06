//
//  ArticleViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit

class ArticleViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib.init(nibName: ArticleTableViewCell.className, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.className)


        }
    }

    @IBOutlet private weak var fetchArticleButton: UIButton! {
        didSet {
            // APIを叩いて記事取得
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()


    }
    


}
