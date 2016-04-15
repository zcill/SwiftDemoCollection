//
//  ViewController.swift
//  Project1-TapCounter
//
//  Created by 朱立焜 on 16/4/12.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Build an Interface with Label and Buttons
// - Use functions with buttons
// - Use NSNumberFormatter
// - Unwrapping Optionals
// - Build custom Navigation Bar

import UIKit

class ViewController: UIViewController {
    
    var totalCount = 0
    
    
    @IBOutlet weak var count: UILabel!
    
    
    @IBAction func resetButtonClicked(sender: UIButton) {
        totalCount = 0
        displayCountInLabel()
    }
    
    @IBAction func tapButtonClick(sender: UIButton) {
        totalCount += 1
        displayCountInLabel()
    }
    
    func displayCountInLabel() -> Void {
        count.text = "\(totalCount)"
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

