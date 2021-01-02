//
//  ViewController.swift
//  Calculator-demo
//
//  Created by Виталий Шаповалов on 02.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userInTheMiddleOfTypingANumber: Bool = false
    
    @IBOutlet weak var display: UILabel!
    
    @IBAction func enter() {
        userInTheMiddleOfTypingANumber = false
    }
    
    var operandStack = Array<Double>()
    
    @IBAction func appendDigitToStack(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userInTheMiddleOfTypingANumber = true
        }
    }
    
}

