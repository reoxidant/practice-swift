//
//  ViewController.swift
//  UISlider
//
//  Created by Виталий Шаповалов on 01.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var label: UILabel!
    @IBOutlet weak var slider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        slider.value = 1
        slider.maximumValue = 1
        slider.minimumValue = 0
        
        label.font = label.font.withSize(35)
        label.text = String(slider.value)
        label.textColor = #colorLiteral(red: 0.2605174184, green: 0.2605243921, blue: 0.260520637, alpha: 1)
        label.textAlignment = .center
        
        slider.thumbTintColor = #colorLiteral(red: 1, green: 1, blue: 1, alpha: 1)
        slider.maximumTrackTintColor = #colorLiteral(red: 0.6642242074, green: 0.6642400622, blue: 0.6642315388, alpha: 1)
        slider.minimumTrackTintColor = #colorLiteral(red: 0.2549019608, green: 0.6117647059, blue: 1, alpha: 1)
    }

    @IBAction func actionSlider(_ sender: UISlider) {
        label.text = String(slider.value)
        
        let bg = super.view.backgroundColor
        
        super.view.backgroundColor = bg?.withAlphaComponent(CGFloat(slider.value))
    }
    
}

