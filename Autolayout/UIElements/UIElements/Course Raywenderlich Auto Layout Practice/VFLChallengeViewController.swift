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
        
        let images = [#imageLiteral(resourceName: "sun-with-face"),#imageLiteral(resourceName: "pirate-flag"),#imageLiteral(resourceName: "cloud-with-rain")]
        
        let imageViews:[UIImageView] = images.map{
            image in let imageView = UIImageView.init(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
        
        let spaceGuides =  (0..<images.count).map{
            _ in UILayoutGuide()
        }
        
        imageViews.forEach(view.addSubview)
        spaceGuides.forEach(view.addLayoutGuide)
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: "|[leftGap]-[sun(fullWidth@849)]-(bigGap)-[pirate(smallWidth@849)]-(gap)-[weather(smallWidth@849)]-(gap)-[rightGap(==leftGap)]|",
                options: .alignAllBottom,
                metrics: {
                    let fullWidth = imageViews[0].image!.size.width
                    let gap: CGFloat = 10
                    return [
                        "fullWidth": fullWidth,
                        "smallWidth": fullWidth * 0.7,
                        "bigGap": gap * 3,
                        "gap": gap
                    ]
            }(),
                views: Dictionary(
                    uniqueKeysWithValues: [
                        (["sun", "pirate", "weather"], imageViews),
                        (["leftGap", "rightGap"], spaceGuides)
                        ].flatMap(
                            {
                                (arg0) -> Zip2Sequence <[String], [Any]> in
                                let (keys, values) = arg0 as! ([String], [Any])
                                return zip(keys, values)
                            }
                    )
                )
            )
            + [imageViews[0].centerYAnchor.constraint(equalTo: view.centerYAnchor)]
            + imageViews.map{
                imageView in imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            }
        )
    }
}
