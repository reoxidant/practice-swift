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
    
    @IBOutlet var operationButtons: [UIButton]!
    
    @IBOutlet weak var returnButton: UIButton!
    
    var userIsInTheMiddleOfTypingANumber: Bool = false
    
    var operandStack = Array<Double>()
    
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
    
    var displayValue: Double
    {
        get
        {
            return NSString(string: display.text!).doubleValue
        }
        set
        {
            display.text = "\(newValue)"
            userIsInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func enter() {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        
        print("operand stack = \(operandStack)")
    }
    
    override func viewDidLoad()
    {
        func designButtons(arButtons: Array<UIButton>, returnBtn: UIButton)
        {
            if arButtons.count > 0
            {
                for btnItem in arButtons
                {
                    btnItem.layer.shadowColor = UIColor.black.cgColor
                    btnItem.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
                    btnItem.layer.shadowOpacity = 0.3
                    btnItem.layer.masksToBounds = false
                    btnItem.layer.cornerRadius = btnItem.frame.width / 2
                }
            }
            returnBtn.layer.shadowColor = UIColor.black.cgColor
            returnBtn.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            returnBtn.layer.cornerRadius = returnBtn.frame.width / 4
            
        }
        designButtons(arButtons: digitButtons, returnBtn: returnButton)
        designButtons(arButtons: operationButtons, returnBtn: returnButton)
        
    }
}
