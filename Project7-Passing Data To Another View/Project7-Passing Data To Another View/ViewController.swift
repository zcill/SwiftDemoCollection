//
//  ViewController.swift
//  Project7-Passing Data To Another View
//
//  Created by 朱立焜 on 16/4/13.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Store data in memory before changing views
// - Send stored data from one view to the other

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var textView: UITextView!

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "Details" {
            let vc = segue.destinationViewController as! SecondViewController
            vc.setValue(textView.text, forKey: "text")
        }
        
    }

}

