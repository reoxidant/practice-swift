//
//  ViewController.swift
//  SliderColors
//
//  Created by Виталий Шаповалов on 11.10.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ColorViewController: UIViewController {
    
    @IBOutlet weak var colorView: UIView!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    var currentColorValue: UIColor {
        get {
            let redColor = CGFloat(redSlider.value)
            let greenColor = CGFloat(greenSlider.value)
            let blueColor = CGFloat(blueSlider.value)
            
            return UIColor(red: redColor/255, green: greenColor/255, blue: blueColor/255, alpha: 1)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        colorView.layer.cornerRadius = 10
        colorView.backgroundColor = currentColorValue
    }

    @IBAction func sliderChanged(sender: UISlider) {
        setValue(by:sender.tag, value: String(Int(sender.value)))
        colorView.backgroundColor = currentColorValue
    }
    
    private func setValue(by senderTag: Int, value: String){
        switch senderTag {
            case 0:
                redLabel.text = value
            case 1:
                greenLabel.text = value
            case 2:
                blueLabel.text = value
                
            default: break
        }
    }
}

