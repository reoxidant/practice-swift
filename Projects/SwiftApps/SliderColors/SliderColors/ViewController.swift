//
//  ViewController.swift
//  SliderColors
//
//  Created by Виталий Шаповалов on 11.10.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    var currentColorValue: UIColor {
        get {
            let redColor: CGFloat = CGFloat(redSlider.value)
            let greenColor: CGFloat = CGFloat(greenSlider.value)
            let blueColor: CGFloat = CGFloat(blueSlider.value)
            
            return UIColor(red: redColor, green: greenColor, blue: blueColor, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func redSliderChanged() {
        redLabel.text = String(format: "%.2f", redSlider.value)
        colorView.backgroundColor = currentColorValue
    }
    
    @IBAction func greenSliderChanged() {
        greenLabel.text = String(format: "%.2f", greenSlider.value)
        colorView.backgroundColor = currentColorValue
    }
    
    @IBAction func blueSliderChanged() {
        blueLabel.text = String(format: "%.2f", blueSlider.value)
        colorView.backgroundColor = currentColorValue
    }
}

