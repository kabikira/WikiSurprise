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
    @IBOutlet private weak var indicator: UIActivityIndicatorView!

    @IBOutlet private weak var fetchArticleButton: UIButton! {
        didSet {
            fetchArticleButton.addTarget(self, action: #selector(tapFetchArticleButton(_sender:)), for: .touchUpInside)

            }
    }

    private var articles: [Article] = []

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        indicator.isHidden = true
    }

    @objc func tapFetchArticleButton(_sender: UIButton) {
        print("HEY")
        indicator.isHidden = false
        tableView.isHidden = true
        WikiAPI.shared.getArticle() { result in
            DispatchQueue.main.async {
                self.indicator.isHidden = true
                self.tableView.isHidden = false
                switch result {
                case .failure(let error):
                    // 仮のエラーハンドリング
                    print(error)
                case.success(let models):
                    print(models)
                    self.articles = models
                    self.tableView.reloadData()
                }
            }
        }

    }

}

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // ルーターで画面遷移処理
    }
}

extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.className) as?
                ArticleTableViewCell else {
            fatalError()
        }

        let article = articles[indexPath.row]
        cell.configure(article: article)
        print("\(cell)")
        return cell

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // 仮の実装
        return 5
    }
}
