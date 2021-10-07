//
//  ViewController.swift
//  TrafficLights
//
//  Created by Виталий Шаповалов on 06.10.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

enum LightView {
    case red
    case yellow
    case green
}

class ViewController: UIViewController {
    
    @IBOutlet weak var redView: UIView!
    @IBOutlet weak var yellowView: UIView!
    @IBOutlet weak var greenView: UIView!
    
    @IBOutlet weak var startButton: UIButton!
    
    var currentLightView: LightView = .red
    
    let lightViewIsOff: CGFloat = 0.3
    let lightViewIsOn: CGFloat = 1
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButton.layer.cornerRadius = 10
        
        setupDefaultAlpha()
        
        print("Размер стороны доступный из viewDidLoad: ", redView.frame.height)
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        redView.layer.cornerRadius = redView.frame.width / 2
        yellowView.layer.cornerRadius = yellowView.frame.width / 2
        greenView.layer.cornerRadius = greenView.frame.width / 2
        
        print("Размер стороны доступный из viewWillLayoutSubviews: ", redView.frame.height)
    }
    
    private func setupDefaultAlpha() {
        redView.alpha = lightViewIsOff
        yellowView.alpha = lightViewIsOff
        greenView.alpha = lightViewIsOff
    }

    @IBAction func toggleTrafficLights() {
        
        startButton.setTitle("NEXT", for: .normal)
        
        switch currentLightView {
            case .red:
                greenView.alpha = lightViewIsOff
                redView.alpha = lightViewIsOn
                currentLightView = .yellow
            case .yellow:
                redView.alpha = lightViewIsOff
                yellowView.alpha = lightViewIsOn
                currentLightView = .green
            case .green:
                yellowView.alpha = lightViewIsOff
                greenView.alpha = lightViewIsOn
                currentLightView = .red
        }
    }
}

