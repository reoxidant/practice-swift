//
//  ViewController.swift
//  TrafficLights
//
//  Created by Виталий Шаповалов on 06.10.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
        
        startButton.layer.cornerRadius = 10
        
        setupDefaultAlpha()
    }
    
    private func setupDefaultAlpha() {
        redView.alpha = 0.3
        yellowView.alpha = 0.3
        greenView.alpha = 0.3
    }

    @IBAction func toggleTrafficLights() {
        
        if redView.alpha != 1 {
            redView.alpha = 1
            startButton.setTitle("NEXT", for: .normal)
        } else if yellowView.alpha != 1 {
            yellowView.alpha = 1
        } else if greenView.alpha != 1 {
            greenView.alpha = 1
        } else {
            startButton.setTitle("START", for: .normal)
            setupDefaultAlpha()
        }
    }
    
}

