//
//  ViewController.swift
//  calculator
//
//  Created by Виталий Шаповалов on 09.10.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController
{
    @IBOutlet weak var display: UILabel!

    @IBOutlet var digitButtons: [UIButton]!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    @IBAction func appendDigit(_ sender: UIButton)
    {
        let digit = sender.currentTitle!
        
        if userIsInTheMiddleOfTypingANumber
        {
            display.text = display.text! + digit
        }
        else
        {
            display.text = digit
            userIsInTheMiddleOfTypingANumber = true
        }
    }
    
    override func viewDidLoad()
    {
        for digit in digitButtons
        {
            digit.layer.shadowColor = UIColor.black.cgColor
            digit.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            digit.layer.shadowOpacity = 0.3
            digit.layer.masksToBounds = false
            digit.layer.cornerRadius = digit.frame.width / 2
        }
    }
}

