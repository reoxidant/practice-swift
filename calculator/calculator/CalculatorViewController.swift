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
    
    @IBAction func enter()
    {
        userIsInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        
        print("operand stack = \(operandStack)")
    }
    
    @IBAction func operate(_ sender: UIButton)
    {
        let operation = sender.currentTitle
        if userIsInTheMiddleOfTypingANumber
        {
            enter()
        }
        switch operation
        {
            case "÷": performOperation {$0 / $1}
            case "×": performOperation {$0 * $1}
            case "−": performOperation {$0 - $1}
            case "+": performOperation {$0 + $1}
            case "√": performOperation {sqrt($0)}
            default: break
        }
    }
    
    func performOperation(operation: (Double, Double) -> Double)
    {
        if operandStack.count >= 2
        {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: (Double) -> Double)
    {
        displayValue = operation(operandStack.removeLast())
        enter()
    }
    
    func multiply(op1: Double, op2: Double) -> Double
    {
        return op1 * op2
    }
    
    func divide(op1: Double, op2: Double) -> Double
    {
        return op1 / op2
    }
    
    func plus(op1: Double, op2: Double) -> Double
    {
        return op1 + op2
    }

    func minus(op1: Double, op2: Double) -> Double
    {
        return op1 - op2
    }
    
    override func viewDidLoad()
    {
        
        func makeDesignForItem(item: UIButton)
        {
            item.layer.shadowColor = UIColor.black.cgColor
            item.layer.shadowOffset = CGSize(width: 0.0, height: 3.0)
            item.layer.shadowOpacity = 0.3
            item.layer.cornerRadius = item.isEqual(returnButton) ? item.bounds.size.width * 0.20 : item.bounds.size.width * 0.5
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
