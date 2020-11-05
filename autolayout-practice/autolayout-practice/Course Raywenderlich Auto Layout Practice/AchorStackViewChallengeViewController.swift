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
        
        let images = [#imageLiteral(resourceName: "cloud-with-rain"),#imageLiteral(resourceName: "sun-with-face"),#imageLiteral(resourceName: "pirate-flag")]
        
        let imageViews:[UIImageView] = images.map{
            image in let imageView = UIImageView.init(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
        
        let countImages = CGFloat(imageViews.count);
        
        
    }
}
