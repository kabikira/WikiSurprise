//
//  WebViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit
import WebKit


final class WebViewController: UIViewController {

    private let alertTitle = "エラー"
    static let storyboardName = "Web"

    static func makeFromStoryboard() -> WebViewController? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() as? WebViewController
    }

    @IBOutlet private weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var connectionErrorView: UIView!

    private var wikiArticle: Article?

    //　タップしたセルからWebViewで表示するURLを受け取るのに使用
    func configure(wikiArticle: Article) {
        self.wikiArticle = wikiArticle
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        webView.navigationDelegate = self
        webView.isHidden = true
        indicator.isHidden = false
        indicator.startAnimating()
        connectionErrorView.isHidden = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshWebView))
        guard
            let wikiArticle = wikiArticle,
            let url = URL(string: wikiArticle.urlStr) else {
                showAlert(title: alertTitle,message: WebViewError.connectionError.description)
            return
        }
        let request = URLRequest(url: url)
        Task { @MainActor in
            self.webView.load(request)
            self.webView.isHidden = false
        }
    }

    @objc func refreshWebView() {
        webView.reload()
    }
}

extension WebViewController: WKNavigationDelegate {
    // ページの読み込み失敗
    func webView(_ webView: WKWebView, didFail nabigation: WKNavigation!, withError error: Error) {
            showAlert(title: alertTitle, message: WebViewError.connectionError.description)
        connectionErrorView.isHidden = false
    }
    // ユーザーのネットワーク接続が切れてるとき呼び出し
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
            showAlert(title: alertTitle, message: WebViewError.connectionError.description)
        connectionErrorView.isHidden = false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebView did finish loading.")
        indicator.isHidden = true
        indicator.stopAnimating()
        connectionErrorView.isHidden = true
    }

}
