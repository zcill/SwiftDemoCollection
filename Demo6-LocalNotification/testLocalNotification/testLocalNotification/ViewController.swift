//
//  ViewController.swift
//  testLocalNotification
//
//  Created by 朱立焜 on 16/4/12.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    @IBAction func buttonClicked(sender: UIButton) {
        let completedNotification = setLocalNotification("发送了一条消息", timeToNotification: 3, category: "REPLY_CATEGORY")
        UIApplication.sharedApplication().scheduleLocalNotification(completedNotification)
    }
    
    func setLocalNotification(body: String, timeToNotification: Double, category: String) -> UILocalNotification {
        
        let localNotification: UILocalNotification = UILocalNotification()
        
        localNotification.alertAction = "滑动查看信息"
        localNotification.alertBody = body
        localNotification.soundName = UILocalNotificationDefaultSoundName
        localNotification.applicationIconBadgeNumber = UIApplication.sharedApplication().applicationIconBadgeNumber+1
        localNotification.fireDate = NSDate(timeIntervalSinceNow: timeToNotification)
        
        localNotification.category = category
        
        return localNotification
    }

}

