//
//  AppIntroductionViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/14.
//

import UIKit

class AppIntroductionViewController: UIViewController {

    private let image: UIImage! = UIImage(named: "WikiSurprise")

    @IBOutlet private weak var intorductionImage: UIImageView! {
        didSet {
            intorductionImage.image = image

        }
    }
    @IBOutlet private weak var doneButton: UIButton!

    @IBAction private func nextViewButton(_ sender: Any) {
        UserDefaults.standard.isLogined = true
        doneButton.isEnabled = false
        Router.shared.showArticle(from: self)
    }
    

}
