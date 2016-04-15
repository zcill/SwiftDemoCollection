//
//  ViewController.swift
//  Project8-Swipe To Dismiss Keyboard
//
//  Created by 朱立焜 on 16/4/13.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Work with Gestures
// - Create Custom Navigation Bars
// - Customize the way Back Button are displayed
// - Auto-launch the Keyboard when the View loads

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var textView: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textView.becomeFirstResponder()
        
        let swipe = UISwipeGestureRecognizer(target: self, action: #selector(ViewController.swipeToResignFirstBecoming))
        swipe.direction = .Down
        self.view.addGestureRecognizer(swipe)
    }
    
    func swipeToResignFirstBecoming() {
        textView.resignFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

