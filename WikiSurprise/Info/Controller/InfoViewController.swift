//
//  InfoViewController.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/16.
//

import UIKit

final class InfoViewController: UIViewController {

    private let iconImageName = "icon"
    private let motionEffectRange: CGFloat = 100.0
    static let storyboardName = "Info"

    static func makeFromStoryboard() -> InfoViewController? {
        return UIStoryboard(name: storyboardName, bundle: nil).instantiateInitialViewController() as? InfoViewController
    }

    @IBOutlet private weak var iconImage: UIImageView! {
        didSet {
            if let image: UIImage = UIImage(named: iconImageName) {
                iconImage.image = image
            }
            // モーションエフェクト実装
            let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffect.EffectType.tiltAlongHorizontalAxis)
            xMotion.minimumRelativeValue = -motionEffectRange
            xMotion.maximumRelativeValue = motionEffectRange
            let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffect.EffectType.tiltAlongVerticalAxis)
            yMotion.minimumRelativeValue = motionEffectRange
            yMotion.maximumRelativeValue = motionEffectRange
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
