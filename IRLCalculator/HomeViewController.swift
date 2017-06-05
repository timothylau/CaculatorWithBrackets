//
//  ViewController.swift
//  IRLCalculator
//
//  Created by 刘立夫 on 06/04/2017.
//  Copyright © 2017 Taobao lnc. All rights reserved.
//


import UIKit

class HomeViewController: UIViewController {
    private var calcModel = CalculatorModel() {
        didSet {
            updateUI()
        }
    }
    
    private var operations: Dictionary<String,OperatorType> = [
        "√" : .sqrt,
        "cos" : .cos,
        "*" : .multiply,
        "-" : .subtract,
        "+" : .add,
        "/" : .divide
        //"=" : .equals
    ]
    
    private var constants: Dictionary<String,Double> = [
        "π" : Double.pi,
        "e" : M_E
    ]
    
    private func updateUI() {
        Display.text = calcModel.expression.beautifyNumbers()
        let displayHasText = !Display.text.isEmpty
        DeleteButton.isEnabled = displayHasText
        if displayHasText { //better way to do this?
            if let result = calcModel.result {
                ResultText.text = String(result).beautifyNumbers()
            }
        } else {
            ResultText.text = ""
        }
    }
    
    @IBOutlet weak var Display: UITextView!
    @IBOutlet weak var ResultText: UILabel!
    @IBOutlet weak var DeleteButton: UIButton!
    
    @IBAction func Evaluate() {
        
    }
    
    @IBAction func Clear() {
        calcModel.clear()
    }
    
    @IBAction func Delete() {
        //calcModel.delete()
    }
    
    @IBAction func toggleSign() { //working
        //calcModel.toggleSign()
    }
    
    @IBAction func appendDecimal(_ sender: UIButton) {
        //calcModel.addDecimal()
    }
    
    @IBAction func appendParen(_ sender: UIButton) {
        calcModel.addAutoBracket()
    }
    
    @IBAction func appendNumber(_ sender: UIButton) {
        let numString = sender.currentTitle!
        calcModel.appendToOperand(Double(numString)!)
    }
    
    @IBAction func appendOperator(_ sender: UIButton) {
        let operatorString = sender.currentTitle!
        let operation = operations[operatorString]!
        calcModel.addOperator(operation)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Display.text.removeAll()
        ResultText.text?.removeAll()
        // Do any additional setup after loading the view, typically from a nib.
    }
}

extension String {
    static let DecimalDigits = 6
    
    func beautifyNumbers() -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.maximumFractionDigits = String.DecimalDigits
        
        var text = self as NSString
        var numbers = [String]()
        let regex = try! NSRegularExpression(pattern: "[.0-9]+", options: .caseInsensitive)
        let matches = regex.matches(in: self, options: [], range: NSMakeRange(0, text.length))
        numbers = matches.map { text.substring(with: $0.range) }
        
        for number in numbers {
            text = text.replacingOccurrences(
                of: number,
                with: formatter.string(from: NSNumber(value: Double(number)!))!
                ) as NSString
        }
        return text as String;
    }
}
