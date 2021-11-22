//
//  CalculatorBrain.swift
//  Calculator
//
//  Created by Виталий Шаповалов on 21.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation

class CalculatorBrain{
    
    private enum Op {
        case Operand(Double)
        case Constant(String, () -> Double)
        case Variable(String)
        case UnaryOperation(String, (Double) -> Double)
        case BinaryOperation(Int, String, (Double, Double) -> Double)
        
        
        var description: String
        {
            get {
                switch self {
                case .Operand(let operand): return "\(operand)"
                case .Variable(let symbol): return symbol
                case .Constant(let symbol, _):return symbol
                case .UnaryOperation(let symbol, _): return symbol
                case .BinaryOperation(_, let symbol, _): return symbol
                }
            }
        }
        
        var p​recedence:Int{
            get {
                switch self {
                case .Operand(_), .Variable(_), .UnaryOperation(_, _), .Constant(_, _): return Int.max
                case .BinaryOperation(let precedence, _, _):return precedence
                }
            }
        }
    }
    
    init(){
        func learnOps(op:Op){
            knowsOps[op.description] = op
        }
        learnOps(op:Op.Constant("𝜋"){ .pi })
        learnOps(op:Op.BinaryOperation(1,"×", *))
        learnOps(op:Op.BinaryOperation(1,"÷"){$1 / $0})
        learnOps(op:Op.BinaryOperation(0,"+", +))
        learnOps(op:Op.BinaryOperation(0,"-"){$1 - $0})
        learnOps(op:Op.UnaryOperation("√", sqrt))
        learnOps(op:Op.UnaryOperation("sin", sin))
        learnOps(op:Op.UnaryOperation("cos", cos))
        learnOps(op:Op.UnaryOperation("+⁄−", { -$0 }))
        learnOps(op:Op.UnaryOperation("%"){$0 / 100})
    }
    
    private var opStack = [Op]()
    private var knowsOps = [String:Op]()
    
    var variableValues = [String:Double]()
    
    var description:String{
        get{
            let brainOps = describeBrainOps(opStack: opStack, description: [String]())
            return brainOps.joined(separator: ", ")
        }
    }
    
    private func evaluate(ops:[Op]) -> (result:Double?, remainingOps:[Op]){
        
        if !ops.isEmpty{
            var remainingOps = ops
            let op = remainingOps.removeLast();
            
            switch op {
            case .Operand(let operand):
                //MARK: do if u will click on enter or if u click on operation - first take a operate number to do the enter function and later add into opStack. In case operation take it first for the switch statement to recurse calculate value
                
                return (operand, remainingOps)
            case .Variable(let variable):
                if let variableValue = variableValues[variable]{
                    return (variableValue, remainingOps)
                }
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(ops:remainingOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, _, let operation):
                let op1Eval = evaluate(ops:remainingOps)
                if let operand1 = op1Eval.result{
                    let op2Eval = evaluate(ops:op1Eval.remainingOps)
                    if let operand2 = op2Eval.result{
                        return (operation(operand1, operand2), op2Eval.remainingOps)
                    }
                }
            case .Constant(_, let operation):
                return (operation(), remainingOps)
            }
        }
        
        return (nil, ops)
    }
    
    func evaluate() -> Double?{
        let(result, _) = evaluate(ops:opStack)
        return result
    }
    
    private func describe(ops:[Op]) -> (description: String?, remainingOps:[Op], precedence: Int)
    {
        if !ops.isEmpty{
            var remainingOps = ops
            let op = remainingOps.removeLast()
            let currentOpP​recedence = op.p​recedence
            
            switch op {
            case .Operand(let stringOperand):
                return ("\(stringOperand)", remainingOps, op.p​recedence)
            case .Variable(let variable):
                return (variable, remainingOps, op.p​recedence)
            case .UnaryOperation(let stringOperation, _):
                let descriptionEvaluation = describe(ops: remainingOps)
                if let description = descriptionEvaluation.description{
                    return ("\(stringOperation) (\(description))", descriptionEvaluation.remainingOps, op.p​recedence)
                }
            case .BinaryOperation(_, let stringOperation, _):
                let op1Eval = describe(ops: remainingOps)
                if var stringOperand1 = op1Eval.description{
                    let op2Eval = describe(ops: op1Eval.remainingOps)
                    stringOperand1 = currentOpP​recedence > op1Eval.precedence ?
                        "(\(stringOperand1))" : stringOperand1
                    if var stringOperand2 = op2Eval.description{
                        stringOperand2 = currentOpP​recedence > op2Eval.precedence ?
                            "(\(stringOperand2))" : stringOperand2
                        return ("\(stringOperand2) \(stringOperation) \(stringOperand1)", op2Eval.remainingOps, op.p​recedence)
                    }
                }
            case .Constant(let stringOperation, _):
                return (stringOperation, remainingOps, op.p​recedence)
            }
        }
        
        return ("?",ops,Int.max)
    }
    
    private func describeBrainOps(opStack:[Op], description:[String]) -> [String]{
        let remainingOps = opStack
        var description = description
        
        if !remainingOps.isEmpty{
            let op = describe(ops: remainingOps)
            
            if let opDescription = op.description{
                description.append(opDescription)
            }
            
            description = describeBrainOps(opStack: op.remainingOps, description: description)
        }
        
        return description
    }
    
    func pushOperand(operand:Double) -> Double?{
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func pushOperand(variable:String) -> Double?{
        opStack.append(Op.Variable(variable))
        return evaluate()
    }
    
    func performOperation(symbol:String)->Double?{
        if let operation = knowsOps[symbol]{
            opStack.append(operation)
        }
        return evaluate()
    }
    
    func setVariableValue(symbol:String, value:Double)->Double?{
        variableValues[symbol] = value
        return evaluate()
    }
    
    func removeStack(){
        opStack = [Op]()
        _ = evaluate()
    }
    
    func removeVariables(){
        variableValues.removeAll()
    }
    
    func returnLastOperation() -> Double?{
        if !opStack.isEmpty {opStack.removeLast()}
        return evaluate()
    }
    
    func evaluateAndReportErrors()->Int?{
        let(codeError, _, _) = evaluateAndReportErrors(ops: opStack)
        return codeError
    }
    
    private func evaluateAndReportErrors(ops:[Op]) -> (errorCode:Int?, result:Double?, remainingOps:[Op]){
        
        if !ops.isEmpty{
            var remainingOps = ops
            let op = remainingOps.removeLast();
            let resultOperation:Double?
            
            switch op {
                
            case .Operand(let operand):
                return (nil, operand, remainingOps)
                
            case .Constant(_, let operation):
                return (nil, operation(), remainingOps)
                
            case .Variable(let variable):
                if variableValues[variable] == nil {
                    return (404, nil, remainingOps)
                }
                return (nil, variableValues[variable], remainingOps)
                
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluateAndReportErrors(ops:remainingOps)
                if let operand = operandEvaluation.result {
                    resultOperation = operation(operand)
                    if (!resultOperation!.isFinite){
                        return (403, nil, operandEvaluation.remainingOps)
                    }
                    return (nil, operation(operand), operandEvaluation.remainingOps)
                } else {
                    return (402, nil, operandEvaluation.remainingOps)
                }
                
            case .BinaryOperation(_, _, let operation):
                let op1Eval = evaluateAndReportErrors(ops:remainingOps)
                if let operand1 = op1Eval.result{
                    let op2Eval = evaluateAndReportErrors(ops:op1Eval.remainingOps)
                    if let operand2 = op2Eval.result{
                        resultOperation = operation(operand1, operand2)
                        if (!resultOperation!.isFinite){
                            return (401, nil, op2Eval.remainingOps)
                        }
                        return (nil, operation(operand1, operand2), op2Eval.remainingOps)
                    } else {
                        return (402, nil, op2Eval.remainingOps)
                    }
                } else {
                    return (402, nil, op1Eval.remainingOps)
                }
            }
        }
        
        return(nil, nil, ops)
    }
}
