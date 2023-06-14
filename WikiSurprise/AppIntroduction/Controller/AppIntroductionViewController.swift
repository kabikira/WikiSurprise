//
//  AppIntroductionViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/14.
//

import UIKit

class AppIntroductionViewController: UIViewController {

    @IBOutlet weak var intorductionImage: UIImageView! {
    }
    @IBOutlet weak var doneButton: UIButton!

    @IBAction func nextViewButton(_ sender: Any) {
        UserDefaults.standard.isLogined = true
        doneButton.isEnabled = false
        Router.shared.showArticle(from: self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    



}
