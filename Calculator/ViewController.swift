//
//  ViewController.swift
//  Calculator
//
//  Created by Craig Kourtu on 8/20/15.
//  Copyright (c) 2015 Moonrat Apps. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var display: UILabel!
    var operandStack = Array<Double>()
    var userIsTypingNumber : Bool = false
    
    var displayValue: Double{
        
        set{
            display.text = "\(newValue)"
            userIsTypingNumber = false
        }
        
        get{
            return NSNumberFormatter().numberFromString(display.text!)!.doubleValue
        }
        
    }
    

  
    @IBAction func enter(sender: UIButton){
        userIsTypingNumber = false
        operandStack.append(displayValue)
        println("\(operandStack)")
        
        
    }
    
    func enter(){
        userIsTypingNumber = false
        operandStack.append(displayValue)
        println(" 2nd \(operandStack)")
    }

    func calculateHelper(operation: (Double,Double) -> Double){
     
     if operandStack.count >= 2
     {
        displayValue = operation(operandStack.removeLast(),operandStack.removeLast())
        print(displayValue)
        enter()
     }
        
    }
    
    @IBAction func calculate(sender: UIButton) {
        if userIsTypingNumber{
            enter()
        }
        
        let operation = sender.currentTitle!
        println("\(operation)")
        
        switch operation{
        case "✕" : calculateHelper { $0 * $1 }
        case "-" : calculateHelper { $1 - $0 }
        case "+" : calculateHelper { $1 + $0 }
        case "⌹" : calculateHelper { $1 / $0 }
        default : break
        }
        
    }
       @IBAction func appendDigit(sender: UIButton){
        
        let digit = sender.currentTitle!
        println("Digit is: \(digit)")
        if userIsTypingNumber{
            display.text = display.text! + digit
        }
        else{
            display.text = digit
            userIsTypingNumber = true
        }
        
    
    }
    

}

