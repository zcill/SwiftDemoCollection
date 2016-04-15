//
//  SecondViewController.swift
//  Project7-Passing Data To Another View
//
//  Created by 朱立焜 on 16/4/13.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    var text = ""
    
    @IBOutlet weak var showTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        showTextLabel.text = text
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
