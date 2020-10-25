//
//  TestNSLayoutViewController.swift
//  autolayout-practice
//
//  Created by Виталий Шаповалов on 25.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class TestNSLayoutViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        // NSLayoutConstraint
        
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
        
        func createConstrains(item: UIView)
        {
            if item.backgroundColor!.isEqual(UIColor.blue)
            {
                NSLayoutConstraint(
                    item: blueSquare,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 0).isActive = true
                NSLayoutConstraint(
                    item: blueSquare,
                    attribute: .top,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .top,
                    multiplier: 1,
                    constant:80).isActive = true
                NSLayoutConstraint(
                    item: blueSquare,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: 50).isActive = true
                NSLayoutConstraint(
                    item: blueSquare,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: 50).isActive = true
            }
            else if item.backgroundColor!.isEqual(UIColor.green)
            {
                NSLayoutConstraint(
                    item: greenSquare,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 0).isActive = true
                NSLayoutConstraint(
                    item: greenSquare,
                    attribute: .bottom,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .bottom,
                    multiplier: 1,
                    constant: -20).isActive = true
                NSLayoutConstraint(
                    item: greenSquare,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: 50).isActive = true
                NSLayoutConstraint(
                    item: greenSquare,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: 50).isActive = true
            }
            else
            {
                NSLayoutConstraint(
                    item: redSquare,
                    attribute: .centerY,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerY,
                    multiplier: 1,
                    constant: 0).isActive = true
                NSLayoutConstraint(
                    item: redSquare,
                    attribute: .centerX,
                    relatedBy: .equal,
                    toItem: view,
                    attribute: .centerX,
                    multiplier: 1,
                    constant: 0).isActive = true
                NSLayoutConstraint(
                    item: redSquare,
                    attribute: .width,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: 100).isActive = true
                NSLayoutConstraint(
                    item: redSquare,
                    attribute: .height,
                    relatedBy: .equal,
                    toItem: nil,
                    attribute: .notAnAttribute,
                    multiplier: 1,
                    constant: 100).isActive = true
            }
        }
        
        createConstrains(item: redSquare)
        createConstrains(item: blueSquare)
        createConstrains(item: greenSquare)
    }
}
