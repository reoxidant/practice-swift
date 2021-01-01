//
//  VFLViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 25.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class VFLViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
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

        view.addSubview(redSquare)
        view.addSubview(blueSquare)
        view.addSubview(greenSquare)
        
        let viewVFL = ["redSquare": redSquare, "blueSquare": blueSquare]
        let metrics = ["height": 100, "width": view.bounds.size.width / 3, "top": view.bounds.size.height / 2]
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-top-[redSquare(height)]|",
                options: [],
                metrics: metrics,
                views: viewVFL
            )
        )
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-top-[blueSquare(height)]|",
                options: [],
                metrics: metrics,
                views: viewVFL
            )
        )
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-top-[greenSquare(height)]|",
                options: [],
                metrics: metrics,
                views: viewVFL
            )
        )
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[blueSquare(width)]-[greenSquare(width)]-[redSquare(width)]-|",
                options: [],
                metrics: metrics,
                views: viewVFL
            )
        )
    }
}
