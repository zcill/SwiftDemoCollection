//
//  EditViewController.swift
//  Project12-Add New Item
//
//  Created by 朱立焜 on 16/4/14.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

typealias sendTextClosure = (string: String) -> Void

class EditViewController: UIViewController, UITextFieldDelegate {
    
    var closure: sendTextClosure?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        textField.becomeFirstResponder()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        
        if closure != nil {
            closure!(string: textField.text!)
        }
        
        textField.resignFirstResponder()
        self.navigationController?.popViewControllerAnimated(true)
        return true
    }

}
