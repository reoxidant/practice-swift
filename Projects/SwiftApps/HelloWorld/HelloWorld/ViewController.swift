//
//  ViewController.swift
//  HelloWorld
//
//  Created by Виталий Шаповалов on 06.10.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var helloWorldLabel: UILabel!
    @IBOutlet weak var toggleButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        helloWorldLabel.isHidden = true
        toggleButton.layer.cornerRadius = 10
    }

    @IBAction func makeButtonAction() {
        helloWorldLabel.isHidden = !helloWorldLabel.isHidden
        
        if helloWorldLabel.isHidden {
            toggleButton.setTitle("Show Text", for: .normal)
        } else {
            toggleButton.setTitle("Hide Text", for: .normal)
        }
        
    }
}

