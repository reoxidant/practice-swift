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
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle
        if userIsInTheMiddleOfTypingANumber
        {
            enter()
        }
        switch operation {
            case "÷":
                if operandStack.count >= 2
                {
                    displayValue = operandStack.removeLast() / operandStack.removeLast()
                }
            case "×":
                if operandStack.count >= 2
                {
                    displayValue = operandStack.removeLast() * operandStack.removeLast()
                }
            case "−":
                if operandStack.count >= 2
                {
                    displayValue = operandStack.removeLast() - operandStack.removeLast()
                }
            case "+":
                if operandStack.count >= 2
                {
                    displayValue = operandStack.removeLast() + operandStack.removeLast()
                }
            default: break
        }
    }
    
    override func viewDidLoad()
    {
        
        func makeDesignForItem(item: UIButton){
            item.layer.shadowColor = UIColor.black.cgColor
            item.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            item.layer.shadowOpacity = 0.3
            item.layer.masksToBounds = false
            item.layer.cornerRadius = item.isEqual(returnButton) ? item.frame.width / 4 : item.frame.width / 2
        }
        
        func designButtons(arButtons: Array<UIButton>)
        {
            if arButtons.count > 0
            {
                for btnItem in arButtons
                {
                    makeDesignForItem(item:btnItem)
                }
            }
        }
        
        designButtons(arButtons: digitButtons)
        designButtons(arButtons: operationButtons)
        makeDesignForItem(item:returnButton)
    }
}
