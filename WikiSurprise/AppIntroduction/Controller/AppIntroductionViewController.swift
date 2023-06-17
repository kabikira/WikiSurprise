//
//  AppIntroductionViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/14.
//

import UIKit

final class AppIntroductionViewController: UIViewController {

    private let image: UIImage! = UIImage(named: "WikiSurprise")
    @IBOutlet private weak var intorductionImage: UIImageView! {
        didSet {
            intorductionImage.image = image
        }
    }
    @IBOutlet private weak var doneButton: UIButton! {
        didSet {
            if UserDefaults.standard.isLogined {
                doneButton.isHidden = true
            }
        }
    }
    @IBAction private func nextViewButton(_ sender: Any) {
        UserDefaults.standard.isLogined = true
        doneButton.isEnabled = false
        Router.shared.showArticle(from: self)
    }
    @IBOutlet private weak var closeButton: UIButton! {
        didSet {
            if isBeingPresented {
                closeButton.isHidden = false
            } else {
                closeButton.isHidden = true
            }
        }
    }
    @IBAction private func closeModalButton(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
}
