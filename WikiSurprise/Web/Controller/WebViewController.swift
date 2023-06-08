//
//  WebViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit
import WebKit

final class WebViewController: UIViewController {

    @IBOutlet private weak var webView: WKWebView!

    private var wikiArticle: Article?

    func configure(wikiArticle: Article) {
        self.wikiArticle = wikiArticle
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let wikiArticle = wikiArticle,
            let url = URL(string: wikiArticle.urlStr) else {
            // 仮のエラー処理
            print("WebView: Error")
            return
        }
        DispatchQueue.global(qos: .userInitiated).async {
            let request = URLRequest(url: url)
            DispatchQueue.main.async {
                self.webView.load(request)
            }
        }

    }
}

