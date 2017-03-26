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

  init(delegate: CalculatorBrainDelegate)
  {
    self.delegate = delegate
  }

  func calculateProblem(operand1: Double, operand2: Double, operatorString: String)
  {
    var result = 0.0
    
    switch operatorString
    {
    case "+":
      result = operand1 + operand2
    case "-":
      result = operand1 - operand2
    case "*":
      result = operand1 * operand2
    case "/":
      if operand2 == 0
      {
        result = 0
      }
      else
      {
        result = operand1 / operand2
      }
    default:
      result = 0
    }
    
    delegate.calculatorBrain(brain: self, didFinishWithResult: String(result))
  }
}
