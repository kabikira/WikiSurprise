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
        guard let vc = UIStoryboard.init(name: "Article", bundle: nil).instantiateInitialViewController() else {
            return
        }
        let nav = UINavigationController(rootViewController: vc)
        window.rootViewController =  nav
        window.makeKeyAndVisible()
        self.window = window
    }
    func showWeb(from: UIViewController, articleModel: Article) {
        guard let web = UIStoryboard.init(name: "Web", bundle: nil).instantiateInitialViewController() as? WebViewController else {
            return
        }
        web.configure(wikiAritcle: articleModel)
        show(from: from, to: web)
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
