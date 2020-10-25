//
//  WeatherViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 23.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
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
        // [<UILayoutGuide: 0x600002030b60 - "", layoutFrame = {{0, 0}, {0, 0}}, owningView = (null)>, <UILayoutGuide: 0x600002030a80 - "", layoutFrame = {{0, 0}, {0, 0}}, owningView = (null)>]
        let spacerGuides = (0..<images.count - 1).map
        {
            _ in UILayoutGuide()
        }
        
        
        // <UILayoutGuide: 0x600001e03100 - "", layoutFrame = {{0, 0}, {0, 0}}, owningView = (null)>
        let containerGuide = UILayoutGuide()

        imageViews.forEach(view.addSubview)
        spacerGuides.forEach(view.addLayoutGuide)
        view.addLayoutGuide(containerGuide)
        
        
        //container for 3 items of images display on center of screen
        NSLayoutConstraint.activate(
            [
                containerGuide.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                containerGuide.leadingAnchor.constraint(greaterThanOrEqualTo: view.safeAreaLayoutGuide.leadingAnchor),
                containerGuide.trailingAnchor.constraint(lessThanOrEqualTo: view.safeAreaLayoutGuide.trailingAnchor),
                {
                    let constraint = spacerGuides.first!.widthAnchor.constraint(equalToConstant: 80)
                    constraint.priority = UILayoutPriority(749)
                    return constraint
                }(),
                spacerGuides.last!.widthAnchor.constraint(equalTo: spacerGuides.first!.widthAnchor)
            ]
            //flatMap return one instance of Array
            + imageViews.enumerated().flatMap
            { index, imageView in
                [
                    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor),
                    // | <- [] <- ([]) ?
                    imageView.leadingAnchor.constraint(
                        equalTo:
                        imageView == imageViews.first!
                        ?
                        containerGuide.leadingAnchor : spacerGuides[index-1].trailingAnchor
                    ),
                     // ([]) ? -> [] -> |
                    imageView.trailingAnchor.constraint(
                        equalTo:
                        imageView == imageViews.last!
                        ?
                        containerGuide.trailingAnchor : spacerGuides[index].leadingAnchor)
                ]
            }
            + imageViews.map
            {
                $0.widthAnchor.constraint(equalTo: imageViews.first!.widthAnchor)
            }
        )
        //dropFirst get sequence container of elements but you can direct first number from last
        
    }
}
