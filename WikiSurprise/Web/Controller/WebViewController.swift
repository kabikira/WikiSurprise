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

    private var wikiAritcle: Article?

    func configure(wikiAritcle: Article) {
        self.wikiAritcle = wikiAritcle
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        guard
            let wikiAritcle = wikiAritcle,
            let url = URL(string: wikiAritcle.urlStr) else {
            return
        }
        webView.load(URLRequest(url: url))
    }


}
