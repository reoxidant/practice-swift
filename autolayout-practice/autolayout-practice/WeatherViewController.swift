//
//  WeatherViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 23.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class WeatherViewController: UIViewController {
    
    let redSquare: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = UIColor.red
       return view
   }()
   
   let blueSquare: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = UIColor.blue
       return view
   }()
   
   let greenSquare: UIView = {
       let view = UIView()
       view.translatesAutoresizingMaskIntoConstraints = false
       view.backgroundColor = UIColor.green
       return view
   }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
//        let images = [UIImage(named: "sun-with-face"), UIImage(named: "pirate-flag"), UIImage(named: "cloud-with-rain")]

//        let imageViews:[UIImageView] =
//        images.map
//        {
//            image in
//            let imageView = UIImageView(image: image)
//            imageView.translatesAutoresizingMaskIntoConstraints = false
//            return imageView
//        }
//        [<UILayoutGuide: 0x600002030b60 - "", layoutFrame = {{0, 0}, {0, 0}}, owningView = (null)>, <UILayoutGuide: 0x600002030a80 - "", layoutFrame = {{0, 0}, {0, 0}}, owningView = (null)>]
//        let spacerGuides = (0..<images.count - 1).map
//        {
//            _ in UILayoutGuide()
//        }
        
        
//        <UILayoutGuide: 0x600001e03100 - "", layoutFrame = {{0, 0}, {0, 0}}, owningView = (null)>
//        let containerGuide = UILayoutGuide()

//        imageViews.forEach(view.addSubview)
//        spacerGuides.forEach(view.addLayoutGuide)
//        view.addLayoutGuide(containerGuide)
        
//VFL
       
        
        view.addSubview(redSquare)
        view.addSubview(blueSquare)
        view.addSubview(greenSquare)
        
        let viewVFL = ["redSquare": redSquare, "blueSquare": blueSquare]
        let metrics = ["height": 100, "width": view.bounds.size.width / 3, "top": view.bounds.size.height / 2]
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[redSquare(height)]|",
                options: [],
                metrics: metrics,
                views: viewVFL
            )
        )
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|[blueSquare(height)]|",
                options: [],
                metrics: metrics,
                views: viewVFL
            )
        )
    }
}
