//
//  NavigationBarApperance.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 15.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

enum NavigationBarAppearance {
    static func setUpTitleText(){
        struct FontVariation{
            let horizontalSizeClass: UIUserInterfaceSizeClass
            let style: String
            let size: CGFloat
        }
        
        for variation in [
            FontVariation(horizontalSizeClass: .unspecified, style: "Wide", size: 22),
            FontVariation(horizontalSizeClass: .compact, style: "Thin", size: 14)
            ] {
                UINavigationBar.appearance(
                    for: UITraitCollection(horizontalSizeClass: variation.horizontalSizeClass)
                    ).titleTextAttributes = [
                        NSAttributedString.Key.font: UIFont(
                            name: "MarkerFelt-\(variation.style)",
                            size: variation.size
                            )!
                ]
        }
    }
}
