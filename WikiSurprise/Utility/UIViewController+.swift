//
//  UIViewController+.swift
//  WikiSurprise
//
//  Created by koala panda on 2023/06/22.
//
import UIKit

extension UIViewController {

    func showAlert(title: String, message: String) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
        Task {
            await MainActor.run {
                self.present(alert, animated: true, completion: nil)
            }
        }
    }

    func motionEffect(effectRange: CGFloat, targetView: UIView) {
        let xMotion = UIInterpolatingMotionEffect(keyPath: "center.x", type: UIInterpolatingMotionEffect.EffectType.tiltAlongHorizontalAxis)
        xMotion.minimumRelativeValue = -effectRange
        xMotion.maximumRelativeValue = effectRange
        let yMotion = UIInterpolatingMotionEffect(keyPath: "center.y", type: UIInterpolatingMotionEffect.EffectType.tiltAlongVerticalAxis)
        yMotion.minimumRelativeValue = -effectRange
        yMotion.maximumRelativeValue = effectRange
        targetView.motionEffects = [xMotion, yMotion]
    }
}
