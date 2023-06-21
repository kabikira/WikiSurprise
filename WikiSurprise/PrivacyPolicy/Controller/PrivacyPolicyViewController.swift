//
//  PrivacyPolicyViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/17.
//

import UIKit
import WebKit

final class PrivacyPolicyViewController: UIViewController {

    private let privacyPolicyURL = "https://kabikira.github.io/imael.github.io/privacy/privacy.html"

    static let storyboardName = "PrivacyPolicy"

    static func makeFromStoryboard() -> PrivacyPolicyViewController? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() as? PrivacyPolicyViewController
    }
    @IBOutlet private weak var webView: WKWebView! {
        didSet {
            webView.navigationDelegate = self
        }
    }
    @IBOutlet private weak var indicator: UIActivityIndicatorView!
    @IBOutlet private weak var connectionErrorView: UIView!

    @IBOutlet private weak var closeButton: UIButton! {
        didSet {
                    if isBeingPresented {
                        closeButton.isHidden = false
                    } else {
                        closeButton.isHidden = true
                    }
                }
    }
    @IBAction func closeModalButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
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
            let url = URL(string: privacyPolicyURL) else {
            showError(WebViewError.connectionError.description)
            return
        }
        let request = URLRequest(url: url)
        Task { @MainActor in
            self.webView.load(request)
            self.webView.isHidden = false
        }
    }
    private func showError(_ message: String) {
            let alert = UIAlertController(title: "エラー", message: message, preferredStyle: .alert)
            alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
    @objc func refreshWebView() {
        webView.reload()
    }
}
extension PrivacyPolicyViewController: WKNavigationDelegate {
    // ページの読み込み失敗
    func webView(_ webView: WKWebView, didFail nabigation: WKNavigation!, withError error: Error) {
        showError(WebViewError.pageLoadError.description)
        connectionErrorView.isHidden = false
    }
    // ユーザーのネットワーク接続が切れてるとき呼び出し
    func webView(_ webView: WKWebView, didFailProvisionalNavigation navigation: WKNavigation!, withError error: Error) {
        showError(WebViewError.connectionError.description)
        connectionErrorView.isHidden = false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        print("WebView did finish loading.")
        indicator.isHidden = true
        indicator.startAnimating()
        connectionErrorView.isHidden = true
    }
}
