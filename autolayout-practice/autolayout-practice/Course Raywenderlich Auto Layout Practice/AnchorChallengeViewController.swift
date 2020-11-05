//
//  NSLayoutAnchorViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 26.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class AnchorChallengeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        let images = [#imageLiteral(resourceName: "sun-with-face"),#imageLiteral(resourceName: "cloud-with-rain"),#imageLiteral(resourceName: "pirate-flag")]
        
        let imageViews:[UIImageView] = images.map{
            image in let imageView = UIImageView.init(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
        
        let spaceGuides = (0..<images.count-1).map{
            _ in UILayoutGuide()
        }
        
        let containerGuide = UILayoutGuide()
        
        imageViews.forEach(view.addSubview(_:))
        spaceGuides.forEach(view.addLayoutGuide(_:))
        view.addLayoutGuide(containerGuide)
        
        NSLayoutConstraint.activate(
            [
                containerGuide.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                containerGuide.leadingAnchor.constraint(greaterThanOrEqualTo: view.leadingAnchor),
                containerGuide.trailingAnchor.constraint(lessThanOrEqualTo: view.trailingAnchor),
                {
                    let container = spaceGuides.first!.widthAnchor.constraint(equalToConstant: 80)
                    container.priority = UILayoutPriority(749)
                    return container
                }(),
                spaceGuides.last!.widthAnchor.constraint(equalTo: spaceGuides.first!.widthAnchor)
            ]
            
            + imageViews.enumerated().flatMap{
                index, imageView in
                [
                    imageView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
                    imageView.heightAnchor.constraint(equalTo: imageViews.first!.widthAnchor),
                    imageView.leadingAnchor.constraint(equalTo:
                        {
                            if imageView == imageViews.first!
                            {
                                return containerGuide.leadingAnchor
                            }
                            else
                            {
                                return spaceGuides[index - 1].trailingAnchor
                            }
                        }()
                    ),
                    imageView.trailingAnchor.constraint(equalTo:
                        {
                            if imageView == imageViews.last!
                            {
                                return containerGuide.trailingAnchor
                            }
                            else
                            {
                                return spaceGuides[index].leadingAnchor
                            }
                        }()
                    )
                ]
            }
            
            + imageViews.dropFirst().map{
                $0.widthAnchor.constraint(equalTo: imageViews.first!.widthAnchor)
            }
        )
    }
}
