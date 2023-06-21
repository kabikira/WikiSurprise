//
//  Router.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/04.
//

import UIKit

final class Router {
    static let shared = Router()
    private init() {}

    private var window: UIWindow?

    func showRoot(window: UIWindow) {
        if !UserDefaults.standard.isLogined {
            guard let vc = AppIntroductionViewController.makeFromStoryboard() else {
                return
            }
            let nav = UINavigationController(rootViewController: vc)
            window.rootViewController = nav

        } else {
            guard let vc = ArticleViewController.makeFromStoryboard() else {
                return
            }
            let nav = UINavigationController(rootViewController: vc)
            window.rootViewController =  nav
        }
        window.makeKeyAndVisible()
        self.window = window
    }
    func showArticle(from: UIViewController) {
        guard let Article = ArticleViewController.makeFromStoryboard() else {
            return
        }
        show(from: from, to: Article)
    }
    func showWeb(from: UIViewController, articleModel: Article) {
        guard let web = WebViewController.makeFromStoryboard() else {
            return
        }
        web.configure(wikiArticle: articleModel)
        show(from: from, to: web)
    }

    func showInfo(from: UIViewController) {
        guard let info = InfoViewController.makeFromStoryboard() else {
            return
        }
        show(from: from, to: info)
    }
    func showInfoItems(from: UIViewController, infoItem: InfoItem) {
        //  InfoViewContorollerで分岐してRouterにそれぞれのshowメソッドを実装したほうがいいかもしれない
        // TODO 画面遷移の分岐
        switch infoItem.title {
        case infoItems[0].title:
            print("説明")
            guard let appintorduction = UIStoryboard.init(name: "AppIntroduction", bundle: nil).instantiateInitialViewController() else {
                return
            }
            showPresent(from: from, to: appintorduction)
        case infoItems[1].title:
            print("お問い合わせ")
            // サファリを開いて表示、WebViewで表示するかどちらがいいのかわからない
            if let url = URL(string: "https://docs.google.com/forms/d/e/1FAIpQLSfpFrJaXEElgvXTiovIgSMzstFfu5rATe4pc4L8lIe12MiXWw/viewform") {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                }
            }

        case infoItems[2].title:
            print("プライバシー")
            guard let privacyPolicy = PrivacyPolicyViewController.makeFromStoryboard() else {
                return
            }
            showPresent(from: from, to: privacyPolicy)
        case infoItems[3].title:
            print("Ver")
        default:
            break
        }
    }
    
    private func show(from: UIViewController, to: UIViewController, completion:(() -> Void)? = nil) {
        if let nav = from.navigationController {
            nav.pushViewController(to, animated: true)
            completion?()
        } else {
            from.present(to, animated: true, completion: completion)
        }
    }
    private func showPresent(from: UIViewController,to: UIViewController) {
        from.present(to , animated: true)
    }
}


