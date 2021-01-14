//
//  CalculatorBrain.swift
//  CalculatorDemo
//
//  Created by Виталий Шаповалов on 14.01.2021.
//  Copyright © 2021 Виталий Шаповалов. All rights reserved.
//

import Foundation

class CalculatorBrain{
    private enum Op{
        case Operand(Double)
        case UnaryOperation(String, (Double) -> Double)
        case BinaryOperation(String, (Double, Double) -> Double)
    }
    
    private var opStack = [Op]()
    
    private var knowsOps = [String:Op]()
    
    init(){
        knowsOps["×"] = Op.BinaryOperation("×", *)
        knowsOps["÷"] = Op.BinaryOperation("÷"){$1 / $0}
        knowsOps["+"] = Op.BinaryOperation("+", +)
        knowsOps["−"] = Op.BinaryOperation("−"){$1 - $0}
        knowsOps["√"] = Op.UnaryOperation("√", sqrt)
    }
    
    private func evaluate(ops:[Op]) -> (result: Double?, remainingOps: [Op]){
        
        if !ops.isEmpty{
            var remainingOps = ops
            let op = remainingOps.removeLast()
            switch op{
            case .Operand(let operand):
                    return (operand, remainingOps)
            case .UnaryOperation(_, let operation):
                let operandEvaluation = evaluate(ops: remainingOps)
                if let operand = operandEvaluation.result {
                    return (operation(operand), operandEvaluation.remainingOps)
                }
            case .BinaryOperation(_, let operation):
                let op1Evaluation = evaluate(ops: remainingOps)
                if let operand1 = op1Evaluation.result {
                    let op2Evaluation = evaluate(ops: op1Evaluation.remainingOps)
                    if let operand2 = op2Evaluation.result{
                        return (operation(operand1, operand2), op2Evaluation.remainingOps)
                    }
                }
            }
            
        }
        
        return (nil, ops)
    }
}
