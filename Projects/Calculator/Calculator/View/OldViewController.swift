//
//  ViewController.swift
//  swift-calculator
//
//  Created by Виталий Шаповалов on 01.12.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var display: UILabel!
    
    var typeInTheMiddleOfNumber:Bool = false
    
    var operateStack = Array<Double>()
    
    var displayValue: Double{
        get{
            return (display.text! as NSString).doubleValue
        }
        set{
            display.text = "\(newValue)"
        }
    }
    
    @IBOutlet weak var displayHistory: UILabel!
    
    @IBAction func digitsPressed(_ sender: UIButton) {
        let digit = sender.currentTitle!
        let hasDot = digit.contains(".") && display.text!.contains(".")
        
        if(typeInTheMiddleOfNumber){
            display.text = display.text! + (hasDot ? "" : digit)
        }else{
            display.text = (digit.contains(".") ? "0" + digit : digit)
        }
        typeInTheMiddleOfNumber = true
    }
    
    @IBAction func enter() {
        if typeInTheMiddleOfNumber {
            addHistory(textOperation: display.text!)
        }
        typeInTheMiddleOfNumber = false
        operateStack.append(displayValue)
    }
    
    @IBAction func operate(_ sender: UIButton) {
        let operation = sender.currentTitle!
        
        if(typeInTheMiddleOfNumber){enter()}
        
        addHistory(textOperation:operation)
        
        switch operation{
        case "÷": performOperation {$1 / $0}
        case "×": performOperation {$0 * $1}
        case "-": performOperation {$1 - $0}
        case "+": performOperation {$0 + $1}
        case "sin": performOperation {sin($0 * Double.pi / 180)}
        case "cos": performOperation {cos($0 * Double.pi / 180)}
        case "√": performOperation {sqrt($0)}
        case "𝜋": performOperation {Double.pi}

        default: break;
        }
    }
    
    func performOperation(operation:(Double, Double) -> Double){
        if operateStack.count >= 2{
            displayValue = operation(operateStack.removeLast(), operateStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: (Double) -> Double){
        if operateStack.count >= 1{
            displayValue = operation(operateStack.removeLast())
            enter()
        }
    }
    
    func performOperation(operation: () -> Double){
        displayValue = operation()
        enter()
    }
    
    func addHistory(textOperation:String){
//        displayHistory.text! += " \(textOperation) "
        displayHistory.text! =  displayHistory.text! + " " + textOperation
    }
}
