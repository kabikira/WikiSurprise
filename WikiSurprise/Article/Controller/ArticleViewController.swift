//
//  ArticleViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit
import WebKit

final class ArticleViewController: UIViewController {

    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib.init(nibName: ArticleTableViewCell.className, bundle: nil), forCellReuseIdentifier: ArticleTableViewCell.className)
            tableView.dataSource = self
            tableView.delegate = self

        }
    }
    @IBOutlet private weak var indicator: UIActivityIndicatorView!

    @IBOutlet private weak var fetchArticleButton: UIButton! {
        didSet {
            fetchArticleButton.addTarget(self, action: #selector(tapFetchArticleButton(_sender:)), for: .touchUpInside)

        }
    }

    private var articles: [Article] = []

    private let getArticleErrorMessage = "記事の取得に失敗しました｡"

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        indicator.isHidden = true
        NetworkMonitor.shared.startMonitoring()
        NotificationCenter.default.addObserver(self, selector: #selector(connectionLost), name: NetworkMonitor.connectionLost, object: nil)

    }

    @objc func connectionLost() {
        DispatchQueue.main.async {
            self.showAlert(message: NetworkMonitor.connectionLost.rawValue)
        }

    }

    @objc func tapFetchArticleButton(_sender: UIButton) {
        indicator.isHidden = false
        tableView.isHidden = true
        // APIクライアントの生成
        let client = WikiClient(httpClient: URLSession.shared)
        // リクエストの発行
        let request = WikiAPI.GetArticles()
        // リクエストの送信
        client.send(request: request) { result in
            DispatchQueue.main.async {
                self.indicator.isHidden = true
                self.tableView.isHidden = false
                switch result {
                case .success(let response):
                    print(response)
                    self.articles = response.query.random ?? []
                    print(self.articles)
                    self.tableView.reloadData()
                case .failure(let error):
                    print("!!!!!!!!!!!!!!!\(error)")
                    self.showAlert(message: self.getArticleErrorMessage)
                }
            }

        }

    }
    private func showAlert(message: String) {
        let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }


}

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // 画面遷移後にUITableViewのセルが選択状態のままになってしまうのを防ぐ
        tableView.deselectRow(at: indexPath, animated: true)
        // ルーターで画面遷移処理
        Router.shared.showWeb(from: self, articleModel: articles[indexPath.row])        }
}


extension ArticleViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: ArticleTableViewCell.className) as?
                ArticleTableViewCell else {
            fatalError()
        }

        let article = articles[indexPath.row]
        // デバッグ
        print("Article for cell at row \(indexPath.row): \(article)")
        cell.configure(article: article)
        return cell

    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return articles.count
    }
}
