//
//  ViewController.swift
//  swift-calculator
//
//  Created by Виталий Шаповалов on 01.12.2020.
//  Copyright © 2020 Виталий Шаповалов. All rights reserved.
//

import UIKit

class CalculatorViewController: UIViewController {
    
    @IBOutlet weak var resetOperation: UIButton!
    @IBOutlet weak var display: UILabel!
    @IBOutlet weak var displayHistory: UILabel!
    
    var typeInTheMiddleOfNumber:Bool = false
    
    let codeErrors = [
        404: "The variable x is not set",
        403: "Cannot evaluate operation x with operand x",
        402: "Some operands are missing",
        401: "Cannot evaluate operand x with operand x"
    ]
    
    var displayValue: Double?{
        get{
            return Double(display.text!)
        }
        set{
            displayResult = "\(newValue ?? 0.0)"
        }
    }
    
    var displayResult: String?{
        get{
            return display.text
        }
        set{
            if let errorCode = brain.evaluateAndReportErrors(){
                if let error = codeErrors[errorCode]{
                    display.text = error
                }
            } else {
                display.text = newValue
            }
        }
    }
    
    let brain = CalculatorBrain()
    
    @IBAction func undoAndBackspaceOperation() {
        if typeInTheMiddleOfNumber {
            if display.text!.count > 1{
                display.text = String(display.text!.dropLast())
            } else {
                display.text = "\(0.0)"
                typeInTheMiddleOfNumber = false
            }
        } else {
            displayValue = brain.returnLastOperation()
            if brain.description != ""{
                addToHistory(value: brain.description + " =")
            } else {
                addToHistory(value: " ")
            }
        }
    }
    
    @IBAction func saveInMemory() {
        typeInTheMiddleOfNumber = false
        if let value = brain.setVariableValue(symbol: "M", value: displayValue!){
            displayValue = value
        }
    }
    
    @IBAction func pushFromMemory() {
        if typeInTheMiddleOfNumber{enter()}
        if let value = brain.pushOperand(variable: "M"){
            displayValue = value
        } else {
            displayValue = 0
        }
    }
    
    @IBAction func resetState(_ sender: UIButton) {
        if sender.currentTitle == "C"{
            sender.setTitle("AC", for: .normal)
        } else {
            brain.removeVariables()
        }
        typeInTheMiddleOfNumber = false
        brain.removeStack()
        displayValue = 0
        displayHistory.text! = " "
    }
    
    @IBAction func signPlusMinusPressed(sender:UIButton) {
        if displayValue != 0{
            if typeInTheMiddleOfNumber {
                displayValue = -displayValue!
            } else {
                operate(sender)
            }
        }
    }
    
    @IBAction func operate(_ sender: UIButton) {
        if typeInTheMiddleOfNumber {enter()}
        if let operation = sender.currentTitle {
            if let result = brain.performOperation(symbol:operation){
                displayValue = result
            } else {
                displayValue = 0
            }
            addToHistory(value: brain.description + " =")
        }
    }
    
    @IBAction func digitsPressed(_ sender: UIButton) {
        resetOperation.setTitle("C", for: .normal)
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
        if displayValue != 0 && typeInTheMiddleOfNumber{
            if let result = brain.pushOperand(operand:displayValue!){
                displayValue = result
                addToHistory(value: brain.description + " ⏎")
            } else {
                displayValue = 0
            }
            typeInTheMiddleOfNumber = false
        }
    }
    
    func addToHistory (value:String?)
    {
        if let text = value{
            displayHistory.text! = "\(text)"
        } else {
            displayHistory.text! = " "
        }
    }
}
