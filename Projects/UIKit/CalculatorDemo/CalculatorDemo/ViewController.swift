//
//  ViewController.swift
//  Calculator-demo
//
//  Created by Виталий Шаповалов on 02.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var userInTheMiddleOfTypingANumber = false
    
    @IBOutlet weak var display: UILabel!
    
    var operandStack = Array<Double>()
    
    var displayValue: Double{
        get{
            return (display.text! as NSString).doubleValue
        }
        set{
            display.text! = "\(newValue)"
            userInTheMiddleOfTypingANumber = false
        }
    }
    
    @IBAction func enter() {
        userInTheMiddleOfTypingANumber = false
        operandStack.append(displayValue)
        //        print("operandStack - \(operandStack)")
    }
    
    @IBAction func appendDigitToStack(_ sender: UIButton) {
        let digit = sender.currentTitle!
        if userInTheMiddleOfTypingANumber {
            display.text = display.text! + digit
        } else {
            display.text = digit
            userInTheMiddleOfTypingANumber = true
        }
    }
    
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        if userInTheMiddleOfTypingANumber{enter()}
        switch operation {
        case "×": performOperation {$0 * $1}
        case "÷": performOperation {$1 / $0}
        case "+": performOperation {$0 + $1}
        case "−": performOperation {$1 * $0}
        case "√": performOperation {sqrt($0)}
        default:
            break
        }
    }
    
    func performOperation(operation:(Double, Double) -> Double){
        if operandStack.count >= 2 {
            displayValue = operation(operandStack.removeLast(), operandStack.removeLast())
            enter()
        }
    }
    	
    func performOperation(operation: (Double) -> Double){
        if operandStack.count >= 1 {
            displayValue = operation(operandStack.removeLast())
            enter()
        }
    }
}

