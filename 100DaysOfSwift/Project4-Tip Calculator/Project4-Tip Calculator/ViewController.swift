//
//  ViewController.swift
//  Project4-Tip Calculator
//
//  Created by 朱立焜 on 16/4/13.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Write an app in MVC pattern
// - Work with Computed Properties
// - Create a toolbar above the keyboard
// - Set min and max values for Slider
// - Convert Strings to Int / Double and vice versa
// - Handle calculations with formulas written in the Model
// - Enable or disable objects based on if the keyboard is open
// - Get values from the UISlider and convert them to Int for use in the Model

import UIKit

class ViewController: UIViewController {
    
    var textFieldString = ""
    
    // properties
    @IBOutlet weak var displayCurrencyTextField: UITextField!
    @IBOutlet weak var tipsLabel: UILabel!
    @IBOutlet weak var tipsPercentLabel: UILabel!
    @IBOutlet weak var totalCountLabel: UILabel!
    
    // action
    @IBAction func sliderValueChangedAction(sender: UISlider) {
        tipsPercentLabelDisplay(sender: sender)
        
        if displayCurrencyTextField.text == "" {
            return
        }
        tipsLabelDisplay(sender: sender)
        totalLabelDisplay(sender: sender)
    }
    
    // label's display method
    func tipsPercentLabelDisplay(sender sender: UISlider) {
        let valueInt = NSNumber(float: sender.value * 100).intValue
        tipsPercentLabel.text = "Tips(\(valueInt)%)"
    }
    func tipsLabelDisplay(sender sender: UISlider) {
        let tipsValue = NSNumber(float: sender.value).floatValue
        
        let formatter = NSNumberFormatter()
        
        let textFieldValue = formatter.numberFromString(textFieldString)?.floatValue
        tipsLabel.text = String(format: "$%.2f", tipsValue * textFieldValue!)
    }
    func totalLabelDisplay(sender sender: UISlider) {
        let formatter = NSNumberFormatter()
        
        let textFieldValue = formatter.numberFromString(textFieldString)?.floatValue
        let tipsPercent = NSNumber(float: sender.value).floatValue
        totalCountLabel.text = String(format: "$%.2f", textFieldValue! * (1+tipsPercent))
    }
    func textFieldDisplay() {
        textFieldString = displayCurrencyTextField.text!
        let formatter = NSNumberFormatter()
        let textFieldNumber = formatter.numberFromString(displayCurrencyTextField.text!)?.floatValue
        displayCurrencyTextField.text = String(format: "$%.2f", textFieldNumber!)
    }
    
    // toolbar
    func setupToolBar() -> Void {
        
        let numberToolBar = UIToolbar(frame: CGRectMake(0, 0, self.view.frame.size.width, 50))
        numberToolBar.barStyle = .Default
        numberToolBar.items = [UIBarButtonItem(barButtonSystemItem: .FlexibleSpace, target: self, action: nil), UIBarButtonItem(title: "Done", style: .Plain, target: self, action: #selector(ViewController.doneWithNumberPad))]
        numberToolBar.sizeToFit()
        displayCurrencyTextField.inputAccessoryView = numberToolBar
        
    }
    
    func doneWithNumberPad() {
        if displayCurrencyTextField.text != "" {
            textFieldDisplay()
        }
        displayCurrencyTextField.resignFirstResponder()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupToolBar()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

