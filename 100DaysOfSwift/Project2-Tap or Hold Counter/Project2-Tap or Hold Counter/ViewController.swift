//
//  ViewController.swift
//  Project2-Tap or Hold Counter
//
//  Created by 朱立焜 on 16/4/12.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Use and detect Long Press Gesture
// - Work with multiple actions on one button

import UIKit

class ViewController: UIViewController {

    var totalCount = 0
    
    
    @IBOutlet weak var totalCountLabel: UILabel!
    
    @IBAction func tapButton(sender: UIButton) {
        totalCount += 1
        displayTotalCount()
    }
    
    @IBAction func resetButton(sender: UIButton) {
        totalCount = 0
        displayTotalCount()
    }
    
    @IBAction func longPress(sender: UILongPressGestureRecognizer) {
        totalCount += 1
        displayTotalCount()
    }
    
    func displayTotalCount() -> Void {
        totalCountLabel.text = "\(totalCount)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

