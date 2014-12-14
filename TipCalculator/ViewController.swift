//
//  ViewController.swift
//  TipCalculator
//
//  Created by Jihong Zhang on 12/13/14.
//  Copyright (c) 2014 Jihong Zhang. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let segmentValues : [double_t] = [0.15, 0.20, 0.25]
    
    var billTotal : double_t! = 0
    
    
    @IBOutlet weak var textFieldBillAmount: UITextField!
    @IBOutlet weak var labelTip: UILabel!
    @IBOutlet weak var labelTotal: UILabel!
    
    @IBOutlet weak var textFieldSplitBy: UITextField!
    @IBOutlet weak var labelEachOne: UILabel!
    
    @IBOutlet weak var tipControl: UISegmentedControl!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        labelTip.text = "$0.00"
        labelTotal.text = "$0.00"
        labelEachOne.text = "$0.00"
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func onTapBackToHome(sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    @IBAction func onSegmentedControlValuChanged(sender: UISegmentedControl) {
        onBillAmountEditingChange(textFieldBillAmount)
    }
    
    @IBAction func onBillAmountEditingChange(sender: UITextField) {
        var tipPercentage = segmentValues[tipControl.selectedSegmentIndex]
        
        var billAmountString = NSString(string: textFieldBillAmount.text)
        var billAmount = billAmountString.doubleValue
        var tip = billAmount * tipPercentage
        billTotal = billAmount + tip
        
        var splitBy = NSString(string: textFieldSplitBy.text)
        var eachOne = billTotal / splitBy.doubleValue
        
        labelTip.text = String(format: "$%.2f", tip)
        labelTotal.text = String(format: "$%.2f", billTotal)
        labelEachOne.text = String(format: "$%.2f", eachOne)
    }
    
    
    @IBAction func onSplitByEditingChanged(sender: UITextField) {
        var splitBy = NSString(string: textFieldSplitBy.text)
        var eachOne = billTotal / splitBy.doubleValue
        labelEachOne.text = String(format: "$%.2f", eachOne)
    }
    
    
}

