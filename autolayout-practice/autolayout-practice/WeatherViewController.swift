//
//  WeatherViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 23.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    @IBOutlet private weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let images = [UIImage(named: "sun-with-face"), UIImage(named: "pirate-flag"), UIImage(named: "cloud-with-rain")]

        let imageViews:[UIImageView] =
        images.map
        {
            image in
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }

        imageViews.forEach(stackView.addArrangedSubview)
        
        let imageCount = CGFloat(imageViews.count)
        
        let constraint = stackView.widthAnchor.constraint(
            equalTo: imageViews.first!.widthAnchor,
            multiplier: imageCount,
            constant: 80 * (imageCount - 1))
        constraint.priority = UILayoutPriority(749)
        constraint.isActive = true
        
        
        //container for 3 items of images display on center of screen
        NSLayoutConstraint.activate(
            //flatMap return one instance of Array
            imageViews.map{ imageView in
                imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            }
        )
        //dropFirst get sequence container of elements but you can direct first number from last
    }
}
