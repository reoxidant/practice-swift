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
        
        var description: String{
            get {
                switch self {
                    case .Operand(let operand):
                        return "\(operand)"
                    case .UnaryOperation(let symbol, _):
                        return symbol
                    case .BinaryOperation(let symbol, _):
                        return symbol
                }
            }
        }
    }
    
    private var opStack = [Op]()
    
    private var knowsOps = [String:Op]()
    
    init(){
        func learnOp(op:Op){
            knowsOps[op.description] = op
        }
        learnOp(op: .BinaryOperation("×", *))
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
    
    func evaluate() -> Double?{
        let (result, remainder) = evaluate(ops: opStack)
        print("\(opStack) = \(result ?? 0) with \(remainder) left over")
        return result
    }
    
    func pushOperand(operand:Double) -> Double?{	
        opStack.append(Op.Operand(operand))
        return evaluate()
    }
    
    func performOperation(symbol: String) -> Double?{
        if let operation = knowsOps[symbol]{
            opStack.append(operation)
        }
        return evaluate()
    }
}
