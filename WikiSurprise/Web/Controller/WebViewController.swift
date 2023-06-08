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
        print("test!!!!!")
        print(wikiAritcle)
//        guard
//            let wikiAritcle = wikiAritcle,
//            let url = URL(string: wikiAritcle.urlStr) else {
//            return
//        }
        webView.load(URLRequest(url: URL(string: "https://qiita.com/Imael/items/0c75a2a5fbe5202a79c6")!))
    }


}
