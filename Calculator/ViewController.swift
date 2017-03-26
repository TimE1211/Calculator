//
//  ViewController.swift
//  Calculator
//
//  Created by Timothy Hang on 3/22/17.
//  Copyright © 2017 Timothy Hang. All rights reserved.
// still had a few problems with my delegate skills but david talked me through it

import UIKit


class ViewController: UIViewController, CalculatorBrainDelegate
{

  @IBOutlet weak var outputLabel: UILabel!
  
  var operand1 = ""
  var operand2 = ""
  var operationSymbol = ""
  var calculatorBrain: CalculatorBrain!
  
  override func viewDidLoad()
  {
    super.viewDidLoad()
    calculatorBrain = CalculatorBrain(delegate: self)
    outputLabel.text = ""
  }

  override func didReceiveMemoryWarning()
  {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  
  @IBAction func operandTapped(sender: UIButton)
  {
    if operationSymbol == ""
    {
      operand1 += sender.currentTitle!
      outputLabel.text = operand1
    }
    else
    {
      operand2 += sender.currentTitle!
      outputLabel.text = operand2
    }
  }

  @IBAction func clearTapped(sender: UIButton)
  {
    outputLabel.text = ""
    operand2 = ""
    operand1 = ""
    operationSymbol = ""
  }
  
  @IBAction func operationSymbolTapped(sender: UIButton)
  {
    operationSymbol = sender.currentTitle!
  }
  
  @IBAction func equalsTapped(sender: UIButton)
  {

    if operand1 != ""
      && operand2 != ""
      && operationSymbol != ""
    {
      calculatorBrain.calculateProblem(operand1: Double(operand1)!, operand2: Double(operand2)!, operatorString: operationSymbol)
    }                       //here the brain is called to solve the problem and the result will be sent back(delegate)
    else
    {
        outputLabel.text = "ERROR HUMAN"
    }
  }
  
  func calculatorBrain(brain: CalculatorBrain, didFinishWithResult result: String)
  {
    outputLabel.text = String(result)
    operand2 = ""
    operationSymbol = ""
    operand1 = String(result)
  }

  @IBAction func PositiveOrNegativeTapped(sender: UIButton)
  {
    if operand1 != ""
      && operand2 == ""
      && operationSymbol == ""
    {
      operand1 = String(Double(operand1)! * -1)
      outputLabel.text = operand1
    }
    else
    {
      operand2 = String(Double(operand2)! * -1)
      outputLabel.text = operand2
    }
  }
}

