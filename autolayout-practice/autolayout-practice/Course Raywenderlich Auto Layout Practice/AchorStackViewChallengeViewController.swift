//
//  AchorStackViewChallengeViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 28.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class AchorStackViewChallengeViewController: UIViewController {
    
    @IBOutlet weak var stackView: UIStackView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    
        let images = [#imageLiteral(resourceName: "cloud-with-rain"),#imageLiteral(resourceName: "pirate-flag"),#imageLiteral(resourceName: "sun-with-face")]
 
        let imageViews:[UIImageView] = images.map{
            image in let imageView = UIImageView.init(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
        
        let countImages = CGFloat(images.count)
        
        imageViews.forEach(stackView.addArrangedSubview)
        
        let constraintWidth = stackView.widthAnchor.constraint(equalTo: imageViews.first!.widthAnchor, multiplier: countImages, constant: 100 * (countImages - 1))
        constraintWidth.priority = UILayoutPriority(749)
        constraintWidth.isActive = true
        
        
        NSLayoutConstraint.activate(
            [
                stackView.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
                stackView.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
            ]
            + imageViews.flatMap({
                imageView in
                [
                    imageView.widthAnchor.constraint(equalToConstant: 80),
                    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
                ]
            })
        )
    }
}
