//
//  AppIntroductionViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/14.
//

import UIKit

final class AppIntroductionViewController: UIViewController {

    private let introductionImageName = "WikiSurprise"

    static let storyboardName = "AppIntroduction"

    static func makeFromStoryboard() -> AppIntroductionViewController? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() as? AppIntroductionViewController
    }


    @IBOutlet private weak var guideLabel: UILabel! {
        didSet {
            if traitCollection.userInterfaceIdiom == .pad {
                guideLabel.isHidden = true
            }
        }
    }
    @IBOutlet weak var introductionImage: UIImageView! {
        didSet {
            if let image: UIImage = UIImage(named: introductionImageName) {
                introductionImage.image = image
            }
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
