//
//  ComputerBrainVC.swift
//  Calculator
//
//  Created by Timothy Hang on 3/26/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
//

import Foundation

protocol CalculatorBrainDelegate
{
  func calculatorBrain(brain: CalculatorBrain, didFinishWithResult result: String)
}

class CalculatorBrain
{
  var delegate: CalculatorBrainDelegate

  init(delegate: CalculatorBrainDelegate)                               //David told me to initialize my Class
  {
    self.delegate = delegate
  }

  func calculateProblem(operand1: Double, operand2: Double, operatorString: String)
  {
    var result = ""
    switch operatorString
    {
    case "+":
      result = String(operand1 + operand2)
    case "-":
      result = String(operand1 - operand2)
    case "*":
      result = String(operand1 * operand2)
    case "/":
      if operand2 == 0
      {
        result = "Error"
      }
      else
      {
        result = String(operand1 / operand2)
      }
    default:
      result = "Error"
    }
    
    delegate.calculatorBrain(brain: self, didFinishWithResult: String(result))        //here the brain is sending info back to the delegate
  }
}
