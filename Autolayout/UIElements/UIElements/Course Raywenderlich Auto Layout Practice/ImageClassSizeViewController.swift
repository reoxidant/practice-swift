//
//  ImageClassSizeViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 15.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class AdaptiveEnviromentViewController: UIViewController {
    
    private let imageViews: [UIImageView]
    private let spaceGuides: [UILayoutGuide]
    private var constraints: [NSLayoutConstraint] = []
    
    required init?(coder aDecoder:NSCoder){
        
        let images = [#imageLiteral(resourceName: "weather-sun-small"),#imageLiteral(resourceName: "weather-rain-small"),#imageLiteral(resourceName: "weather-windy-small")]
        
        imageViews = images.map{
            image in let imageView = UIImageView.init(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
        
        spaceGuides =  (0..<images.count).map{
            _ in UILayoutGuide()
        }
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        
        imageViews.forEach(view.addSubview)
        spaceGuides.forEach(view.addLayoutGuide)
        
        activateConstraints(horizontalSizeClass: traitCollection.horizontalSizeClass)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator:
        UIViewControllerTransitionCoordinator){
        super.willTransition(to: newCollection, with: coordinator)
        
        if newCollection.horizontalSizeClass != traitCollection.horizontalSizeClass{
            activateConstraints(horizontalSizeClass: newCollection.horizontalSizeClass)
        }
    }
    
    
    private func activateConstraints(horizontalSizeClass: UIUserInterfaceSizeClass){
        NSLayoutConstraint.deactivate(constraints)
        
        constraints =
            NSLayoutConstraint.constraints(
                withVisualFormat: "|[leftGap]-[sun(fullWidth@849)]-(bigGap)-[pirate(smallWidth@849)]-(gap)-[weather(smallWidth@849)]-(gap)-[rightGap(==leftGap)]|",
                options: .alignAllBottom,
                metrics: {
                    let fullWidth = imageViews[0].image!.imageAsset!.image(with: UITraitCollection(horizontalSizeClass: horizontalSizeClass)).size.width
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
                        })
            ))
            + [imageViews[0].centerYAnchor.constraint(equalTo: view.centerYAnchor)]
            + imageViews.map({
                imageView in imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
            })
        NSLayoutConstraint.activate(constraints)
    }
}
