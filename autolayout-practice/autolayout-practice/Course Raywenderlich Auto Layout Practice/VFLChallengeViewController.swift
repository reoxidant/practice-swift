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
        
        let stringVLF = """
        |[leftGap]\
        -[monday(fullWidth@849)]-(bigGap)\
        -[tuesday(smaller@849)]-(gap)\
        -[wednesday(smaller@849)]-(gap)\
        -[rightGap(==leftGap)]|
        """
        
        NSLayoutConstraint.activate(
            NSLayoutConstraint.constraints(
                withVisualFormat: stringVLF,
                options: .alignAllBottom,
                metrics: {
                    let imageWidth = imageViews[0].image!.size.width
                    let gap: CGFloat = 10
                    return [
                        "fullWidth": imageWidth,
                        "smaller": imageWidth * 0.7,
                        "bigGap": gap * 3,
                        "gap": gap
                    ]
                }(),
                views: Dictionary(uniqueKeysWithValues: [
                    (["monday", "tuesday", "wednesday"], imageViews),
                    (["leftGap", "rightGap"], spaceGuides)
                    ].flatMap({
                        (arg0) -> Zip2Sequence<[String],[Any]> in
                        let (keys, values) = arg0 as! ([String], [Any])
                        return zip(keys,values)
                    })
            
            ))
            + [imageViews[0].centerYAnchor.constraint(equalTo: view.centerYAnchor)]
            + imageViews.map({
                imageView in imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            })
        )
    }
}
