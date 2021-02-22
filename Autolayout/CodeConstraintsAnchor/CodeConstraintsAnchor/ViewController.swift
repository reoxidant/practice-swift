//
//  ViewController.swift
//  CodeConstraintsAnchor
//
//  Created by Виталий Шаповалов on 22.02.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    let blueCube: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 100, height: 100)
        view.backgroundColor = .blue
        return view
    }()
    
    let redCude: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.frame = CGRect(x: 0, y: 0, width: 50, height: 50)
        view.backgroundColor = .red
        return view
    }()
    
    let orangeCube: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .orange
        return view
    }()

    let yellowCude: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.backgroundColor = .yellow
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        view.addSubview(blueCube)
        view.addSubview(redCude)
        view.addSubview(orangeCube)
        view.addSubview(yellowCude)
        installBlueCubeConstrains()
        installRedCubeConstrains()
        installVFLConstains()
    }
    
    func installBlueCubeConstrains(){
        NSLayoutConstraint(
            item: blueCube,
            attribute: .leading,
            relatedBy: .equal,
            toItem: view,
            attribute: .leading,
            multiplier: 1,
            constant: 20).isActive = true
        NSLayoutConstraint(
            item: blueCube,
            attribute: .centerY,
            relatedBy: .equal,
            toItem: view,
            attribute: .centerY,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: blueCube,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 100).isActive = true
        NSLayoutConstraint(
            item: blueCube,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 100).isActive = true
    }
    
    func installRedCubeConstrains(){
        NSLayoutConstraint(
            item: redCude,
            attribute: .top,
            relatedBy: .equal,
            toItem: blueCube,
            attribute: .bottom,
            multiplier: 1,
            constant: 20).isActive = true
        NSLayoutConstraint(
            item: redCude,
            attribute: .centerX,
            relatedBy: .equal,
            toItem: blueCube,
            attribute: .centerX,
            multiplier: 1,
            constant: 0).isActive = true
        NSLayoutConstraint(
            item: redCude,
            attribute: .height,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 50).isActive = true
        NSLayoutConstraint(
            item: redCude,
            attribute: .width,
            relatedBy: .equal,
            toItem: nil,
            attribute: .notAnAttribute,
            multiplier: 1,
            constant: 50).isActive = true
    }
    
    func installVFLConstains(){
        let VFLViews = [
            "orangeCube": orangeCube,
            "yellowCude": yellowCude
        ]

        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "V:|-200-[orangeCube(100)]-(10)-[yellowCude(100)]-200-|",
                options: [],
                metrics: nil,
                views: VFLViews)
        )

        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[orangeCube(100)]-(20)-|",
                options: [],
                metrics: nil,
                views: VFLViews)
        )
        
        view.addConstraints(
            NSLayoutConstraint.constraints(
                withVisualFormat: "H:|-[yellowCude(100)]-(20)-|",
                options: [],
                metrics: nil,
                views: VFLViews)
        )
    }
}
