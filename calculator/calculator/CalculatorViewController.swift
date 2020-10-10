//
//  ViewController.swift
//  calculator
//
//  Created by Виталий Шаповалов on 09.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    @IBOutlet weak var display: UILabel!
    
    @IBOutlet weak var digit: UIButton!
    
    @IBAction func appendDigit(_ sender: UIButton) {
    }
    
    override func viewDidLoad() {
        digit.layer.shadowColor = UIColor.black.cgColor
        digit.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
        digit.layer.shadowOpacity = 0.5
        digit.layer.masksToBounds = false
        digit.layer.cornerRadius = digit.frame.width / 2
    }
}

