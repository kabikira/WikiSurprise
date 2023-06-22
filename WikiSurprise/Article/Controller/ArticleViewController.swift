//
//  ArticleViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit
import WebKit


final class ArticleViewController: UIViewController {

    private var articles: [Article] = []
    private let navigationTitle = "WikiSurprise"
    private let backButtonTitle = "Back"
    private let getArticleErrorMessage = "記事の取得に失敗しました｡"
    private let alertTitle = "エラー"
    private let rightBarButtonTitle = "info"
    private let iconImageName = "icon"
    private let motionEffectRange: CGFloat = 200.0

    static let storyboardName = "Article"

    static func makeFromStoryboard() -> ArticleViewController? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() as? ArticleViewController
    }

    @IBOutlet weak var motionImageView: UIImageView! {
        didSet {

            if let image: UIImage = UIImage(named: iconImageName) {
                motionImageView.image = image
            }
           motionEffect(effectRange: motionEffectRange, targetView: motionImageView)
        }
    }

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

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.isHidden = true
        indicator.isHidden = true

//        navigationItem.hidesBackButton = true
//        navigationItem.title = navigationTitle
//        navigationItem.backButtonTitle = backButtonTitle
//
//        navigationItem.rightBarButtonItem = UIBarButtonItem(title:rightBarButtonTitle, style: .done, target: self, action: #selector(tappedInfo))

        setUpNavigationBar(title: navigationTitle, backButtonTitle: backButtonTitle, rightButtonTitle: rightBarButtonTitle, rightBarButtonAction: #selector(tappedInfo))


        NetworkMonitor.shared.startMonitoring()
        NotificationCenter.default.addObserver(self, selector: #selector(connectionLost), name: NetworkMonitor.connectionLost, object: nil)
    }
    @objc func tappedInfo() {
        Router.shared.showInfo(from: self)
    }
    @objc func connectionLost() {
            showAlert(title: alertTitle, message: NetworkMonitor.connectionLost.rawValue)

    }
    @objc func tapFetchArticleButton(_sender: UIButton) {
        hideIndicator()
        fetchArticles()

    }

    private func hideIndicator() {
        indicator.isHidden = false
        indicator.startAnimating()
        tableView.isHidden = true
        fetchArticleButton.isEnabled = false
    }

    private func fetchArticles()  {
        // APIクライアントの生成
        let client = WikiClient(httpClient: URLSession.shared)
        // リクエストの発行
        let request = WikiAPI.GetArticles()
        // リクエストの送信
        Task {
            do {
                articles = try await client.send(request: request).query.random ?? []
                print(articles)
                await MainActor.run {
                    indicator.isHidden = true
                    indicator.stopAnimating()
                    tableView.isHidden = false
                    motionImageView.isHidden = true
                    fetchArticleButton.isEnabled = true
                    tableView.reloadData()
                }
            } catch(let error) {
                print(error)
                    showAlert(title: alertTitle, message: getArticleErrorMessage)
            }
        }
    }
}

extension ArticleViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        Router.shared.showWeb(from: self, articleModel: articles[indexPath.row])
    }
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
