//
//  VFLRayViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 26.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class VFLChallengeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let images = [#imageLiteral(resourceName: "sun-with-face"),#imageLiteral(resourceName: "pirate-flag"),#imageLiteral(resourceName: "cloud-with-rain")];
        
        let imageViews:[UIImageView] = images.map{
            image in let imageView = UIImageView.init(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
        
        let spacerGuides = (0..<images.count - 1).map{_ in UILayoutGuide()}
        let containerGuide = UILayoutGuide()
        
        imageViews.forEach(view.addSubview)
        spacerGuides.forEach(view.addLayoutGuide)
        view.addLayoutGuide(containerGuide)
    }
}
