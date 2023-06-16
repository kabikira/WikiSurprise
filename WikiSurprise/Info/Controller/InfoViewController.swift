//
//  InfoViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/16.
//

import UIKit

class InfoViewController: UIViewController {

    private let image: UIImage! = UIImage(named: "icon")
    @IBOutlet private weak var iconImage: UIImageView! {
        didSet {
            iconImage.image = image
        }
    }
    @IBOutlet private weak var tableView: UITableView! {
        didSet {
            tableView.register(UINib.init(nibName: InfoViewCell.className, bundle: nil), forCellReuseIdentifier: InfoViewCell.className)
            tableView.dataSource = self
            tableView.delegate = self
            tableView.reloadData()
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()

    }
    


}
extension InfoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        infoItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: InfoViewCell.className) as? InfoViewCell else {
            fatalError()
        }
        let infoItem = infoItems[indexPath.row]

        cell.configure(infoItem: infoItem)
        return cell
    }
}

extension InfoViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        Router.shared.showInfoItems(from: self, infoItem: infoItems[indexPath.row])
    }
}
