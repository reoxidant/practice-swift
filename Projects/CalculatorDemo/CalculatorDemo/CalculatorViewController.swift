//
//  CalculatorViewController.swift
//  CalculatorDemo
//
//  Created by Виталий Шаповалов on 03.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    var userInTheMiddleOfNumber = false
    
    @IBOutlet weak var display: UILabel!
    
//    var operateStack = Array<Double>()
    
    var brain = CalculatorBrain()
    
    var displayValue:Double{
        get{
            return (display.text! as NSString).doubleValue
        }
        set{
            display.text! = "\(newValue)"
            userInTheMiddleOfNumber = false
        }
    }
    
    @IBAction func digitPressed(_ sender: UIButton) {
        
        if userInTheMiddleOfNumber{
            display.text! = display.text! + sender.currentTitle!
        } else {
            display.text! = sender.currentTitle!
            userInTheMiddleOfNumber = true
        }
    }
    
    @IBAction func enter() {
        userInTheMiddleOfNumber = false
//        operateStack.append(displayValue)
//        print("operateStack - \(operateStack)")
        if let result = brain.pushOperand(operand:displayValue) {
            displayValue = result
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        if userInTheMiddleOfNumber {enter()}
        if let operation = sender.currentTitle{
            
        }
    }
    
    //@IBAction func operate(_ sender: UIButton) {
    //    let operation = sender.currentTitle!
    //
    //    if userInTheMiddleOfNumber {enter()}
    //
    //    switch operation {
    //    //        case "×": performOperation(operation:{(op1:Double, op2:Double) in return op1 * op2})
    //    //        case "×": performOperation(operation:{(op1, op2) in op1 * op2})
    //    //        case "×": performOperation {(op1, op2) in op1 * op2}
    //    case "×": performOperation {$0 * $1}
    //    case "÷": performOperation {$1 / $0}
    //    case "+": performOperation {$0 + $1}
    //    case "−": performOperation {$1 - $0}
    //    case "√": performOperation {sqrt($0)}
    //    default:
    //        break
    //    }
    //}
    //
    //func performOperation(operation:(Double, Double) -> Double){
    //    if operateStack.count >= 2{
    //        displayValue = operation(operateStack.removeLast(),operateStack.removeLast())
    //        enter()
    //    }
    //}
    //
    //func performOperation(operation:(Double) -> Double){
    //    if operateStack.count >= 1{
    //        displayValue = operation(operateStack.removeLast())
    //        enter()
    //    }
    //}

    //    func miltiply(op1:Double, op2:Double) -> Double{
    //        return op1 * op2
    //    }
}

