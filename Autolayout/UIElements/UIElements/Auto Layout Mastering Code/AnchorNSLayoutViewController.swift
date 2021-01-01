//
//  AnchorNSLayoutViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 25.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class AnchorNSLayoutViewController: UIViewController {

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
        
        redSquare.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 20).isActive = true
        redSquare.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 1/3).isActive = true
        redSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        redSquare.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        blueSquare.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -20).isActive = true
        blueSquare.widthAnchor.constraint(equalToConstant: 100).isActive = true
        blueSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        blueSquare.heightAnchor.constraint(equalToConstant: 100).isActive = true
        
        greenSquare.leftAnchor.constraint(equalTo: redSquare.rightAnchor, constant: 10).isActive = true
        greenSquare.rightAnchor.constraint(equalTo: blueSquare.leftAnchor, constant: -10).isActive = true
        greenSquare.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        greenSquare.heightAnchor.constraint(equalToConstant: 100).isActive = true
    }
}
