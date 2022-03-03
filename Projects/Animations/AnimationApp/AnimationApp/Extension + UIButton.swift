//
//  Extension + UIButton.swift
//  AnimationApp
//
//  Created by Виталий Шаповалов on 20.11.2021.
//

import Foundation
import UIKit

extension UIButton {
    func pulsate() {
        let animation = CASpringAnimation(keyPath: "transform.scale")
        animation.duration = 0.6
        animation.fromValue = 0.9
        animation.toValue = 1.0
        animation.initialVelocity = 0.5
        animation.repeatCount = 2
        animation.damping = 1.0
        animation.autoreverses = true
        
        layer.add(animation, forKey: nil)
    }
}
