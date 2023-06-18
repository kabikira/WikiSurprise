//
//  InfoViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/16.
//

import UIKit

final class InfoViewController: UIViewController {

    @IBOutlet private weak var iconImage: UIImageView! {
        didSet {
            if let image: UIImage = UIImage(named: "icon") {
                iconImage.image = image
            }
            // モーションエフェクト実装
            let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffect.EffectType.tiltAlongHorizontalAxis)
            xMotion.minimumRelativeValue = -100.0
            xMotion.maximumRelativeValue = 100.0
            let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffect.EffectType.tiltAlongVerticalAxis)
            yMotion.minimumRelativeValue = -100.0
            yMotion.maximumRelativeValue = 100.0
            iconImage.motionEffects = [xMotion, yMotion]
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
