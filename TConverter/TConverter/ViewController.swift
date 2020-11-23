//
//  ViewController.swift
//  TConverter
//
//  Created by Виталий Шаповалов on 23.11.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var celsiusLabel: UILabel!
    @IBOutlet weak var fahrenheitLabel: UILabel!
    @IBOutlet weak var slider: UISlider! {
        didSet {
            slider.maximumValue = 100
            slider.minimumValue = 0
            slider.value = 0
            slider.maximumTrackTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
            slider.minimumTrackTintColor = #colorLiteral(red: 0.2606713474, green: 0.2645770609, blue: 0.5889394879, alpha: 1)
            slider.thumbTintColor = #colorLiteral(red: 0.9999960065, green: 1, blue: 1, alpha: 1)
        }
    }
    
    
    @IBAction func sliderChanged(_ sender: UISlider) {
        let temperatureCelsius = Int(round(sender.value))
        celsiusLabel.text = "\(temperatureCelsius)ºC"
        let fahrenheitTemperature = Int(round((sender.value * 9 / 5) + 32))
        fahrenheitLabel.text = "\(fahrenheitTemperature)ºF"
    }
}

