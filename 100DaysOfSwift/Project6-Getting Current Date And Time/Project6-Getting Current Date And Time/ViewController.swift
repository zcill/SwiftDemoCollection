//
//  ViewController.swift
//  Project6-Getting Current Date And Time
//
//  Created by 朱立焜 on 16/4/13.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Work with NSDate and NSDateFormatter
// - Set the current date and time based on the user's iPhone settings
// - Format the date to the user's UTC time
// - Refresh date and time

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func refreshButton(sender: UIButton) {
        displayCurrentDateAndTime()
    }
    
    func displayCurrentDateAndTime() {
        let currentDate = NSDate()
        let formatter = NSDateFormatter()
        formatter.dateStyle = .MediumStyle
        formatter.timeStyle = .MediumStyle
        let string = formatter.stringFromDate(currentDate)
        timeLabel.text = string
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

