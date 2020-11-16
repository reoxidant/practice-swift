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
    private let spacerGuides: [UILayoutGuide]
    private var constraints: [NSLayoutConstraint] = []
    
    required init?(coder aDecoder: NSCoder) {
        let images = [#imageLiteral(resourceName: "weather-sun-small"), #imageLiteral(resourceName: "weather-windy-small"), #imageLiteral(resourceName: "weather-rain-small")]
        
        imageViews = images.map { (image) in
            let imageView = UIImageView(image: image)
            imageView.translatesAutoresizingMaskIntoConstraints = false
            return imageView
        }
        
        spacerGuides = (0..<images.count).map { _ in UILayoutGuide() }
        
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        imageViews.forEach(view.addSubview)
        spacerGuides.forEach(view.addLayoutGuide)
        
        activateConstraints(horizontalSizeClass: traitCollection.horizontalSizeClass)
    }
    
    override func willTransition(to newCollection: UITraitCollection, with coordinator: UIViewControllerTransitionCoordinator) {
        super.willTransition(to: newCollection, with: coordinator)
        
        if newCollection.horizontalSizeClass != traitCollection.horizontalSizeClass {
            activateConstraints(horizontalSizeClass: newCollection.horizontalSizeClass)
        }
    }
    
    private func activateConstraints(horizontalSizeClass: UIUserInterfaceSizeClass) {
        NSLayoutConstraint.deactivate(constraints)
        
        constraints =
            NSLayoutConstraint.constraints(
                withVisualFormat: """
                |[leftGap]\
                -[monday(fullWidth@849)]-(bigGap)\
                -[tuesday(smaller@849)]-(gap)-[wednesday(smaller@849)]\
                -(gap)-[rightGap(==leftGap)]|
                """,
                options: .alignAllBottom,
                metrics: {
                    let imageWidth = imageViews[0].image!.imageAsset!.image(with: UITraitCollection(horizontalSizeClass: horizontalSizeClass)).size.width
                    let gap: CGFloat = 8
                    return [
                        "fullWidth": imageWidth,
                        "smaller": imageWidth * 0.7,
                        "bigGap": gap * 3,
                        "gap": gap
                    ]
            }(),
                views: Dictionary(uniqueKeysWithValues: [
                    (["monday", "tuesday", "wednesday"], imageViews),
                    (["leftGap", "rightGap"], spacerGuides)
                    ].flatMap({ (arg0) -> Zip2Sequence<[String], [Any]> in
                        let (keys, values) = arg0 as! ([String], [Any])
                        return zip(keys, values)
                    })
            ))
                + [imageViews[0].centerYAnchor.constraint(equalTo: view.centerYAnchor)]
                + imageViews.map({ imageView in
                    imageView.heightAnchor.constraint(equalTo: imageView.widthAnchor)
                })
            
        NSLayoutConstraint.activate(constraints)
    }
}
