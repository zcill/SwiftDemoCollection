//
//  ViewController.swift
//  Demo2-ChangeFont
//
//  Created by 朱立焜 on 16/2/17.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var data = ["Swift Demo Collection", "这些字体特别适合打「奋斗」和「理想」", "谢谢「造字工房」，本案例不涉及商业使用", "使用到造字工房劲黑体，致黑体，童心体", "😂Learning Swift", "My Blog: zcill.com"]
    
    var fontNames = ["MFTongXin_Noncommercial-Regular", "MFJinHei_Noncommercial-Regular", "MFZhiHei_Noncommercial-Regular"]
    
    var fontRowIndex = 0
    
    @IBOutlet weak var tableView: UITableView!
    
    @IBAction func changeFont(sender: UIButton) {
        
        print(fontNames[fontRowIndex])
        
        fontRowIndex = (fontRowIndex + 1) % 3
        tableView.reloadData()
        
    }
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.dataSource = self
        tableView.delegate = self
        
        /*
        for fontFamily in UIFont.familyNames() {
            for font in UIFont.fontNamesForFamilyName(fontFamily) {
                print(font)
            }
        }
        */
    }
    
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        return 50
    }

    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {

        let cell = tableView.dequeueReusableCellWithIdentifier("FontCell", forIndexPath: indexPath)
        
        let text = data[indexPath.row]
        
        cell.textLabel?.text = text
        cell.textLabel?.textColor = UIColor.whiteColor()
        cell.textLabel?.font = UIFont(name: self.fontNames[fontRowIndex], size: 16)
        
        return cell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
}

