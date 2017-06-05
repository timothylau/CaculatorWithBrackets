//
//  CalculatorToken.swift
//  IRLCalculator
//
//  Created by 刘立夫 on 06/04/2017.
//  Copyright © 2017 Taobao lnc. All rights reserved.
//

import Foundation

public struct CalculatorToken: CustomStringConvertible {
    let tokenType: TokenType
    
    init(tokenType: TokenType) {
        self.tokenType = tokenType
    }
    
    init(operand: Double) {
        tokenType = .operand(operand)
    }
    
    init(constant: Double) {
        tokenType = .constant(constant)
    }
    
    init(operatorType: OperatorType) {
        tokenType = .Operator(OperatorToken(operatorType: operatorType))
    }
    
    var isOpenBracket: Bool {
        switch tokenType {
        case .openBracket:
            return true
        default:
            return false
        }
    }
    
    var isCloseBracket: Bool {
        switch tokenType {
        case .closeBracket:
            return true
        default:
            return false
        }
    }
    
    var isOperator: Bool {
        switch tokenType {
        case .Operator(_):
            return true
        default:
            return false
        }
    }
    
    var isConstant: Bool {
        switch tokenType {
        case .constant(_):
            return true
        default:
            return false
        }
    }
    
    var isOperand: Bool {
        switch tokenType {
        case .operand(_):
            return true
        default:
            return false
        }
    }
    
    var operatorToken: OperatorToken? {
        switch tokenType {
        case .Operator(let operatorToken):
            return operatorToken
        default:
            return nil
        }
    }
    
    public var description: String {
        return tokenType.description
    }
}

public enum TokenType: CustomStringConvertible {
    case openBracket
    case closeBracket
    case Operator(OperatorToken)
    case operand(Double)
    case constant(Double)
    
    public var description: String {
        switch self {
        case .openBracket:
            return "("
        case .closeBracket:
            return ")"
        case .Operator(let operatorToken):
            return operatorToken.description
        case .operand(let value):
            return String(value)
        case .constant(let value):
            return String(value)
        }
    }
}

public struct OperatorToken: CustomStringConvertible {
    let operatorType: OperatorType
    
    //nsexpression string
    
    init(operatorType: OperatorType) {
        self.operatorType = operatorType
    }
    
    public var description: String {
        return operatorType.description
    }
}


public enum OperatorType: CustomStringConvertible {
    case add
    case subtract
    case divide
    case multiply
    case percent
    case exponent
    case sqrt
    case cos
    
    public var bracketValue: Int {
        switch self {
        case .sqrt, .cos:
            return 1
        default:
            return 0
        }
    }
    
    public var description: String { // change to dict?
        switch self {
        case .add:
            return "+"
        case .subtract:
            return "-"
        case .divide:
            return "/"
        case .multiply:
            return "*"
        case .percent:
            return "%"
        case .exponent:
            return "^"
        case .sqrt:
            return "√(" //chane to no paren?
        case .cos:
            return "cos("
        }
    }
}




