//
//  AppDelegate.swift
//  testLocalNotification
//
//  Created by 朱立焜 on 16/4/12.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        
        let replyAction = UIMutableUserNotificationAction()
        replyAction.title = "回复"
        replyAction.identifier = "inline-reply"
        replyAction.activationMode = .Background
        replyAction.authenticationRequired = false
        replyAction.behavior = .TextInput
        
        let notificationCategory: UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        notificationCategory.identifier = "REPLY_CATEGORY"
        notificationCategory.setActions([replyAction], forContext: UIUserNotificationActionContext.Default)
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Sound, .Alert, .Badge], categories: NSSet(array: [notificationCategory]) as? Set<UIUserNotificationCategory>))
        
        
        /*
        // 注册复合本地通知
        let notificationActionOk: UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        notificationActionOk.identifier = "completeRemindLater"
        notificationActionOk.title = "再工作一会"
        
        // 是否取消提醒
        notificationActionOk.destructive = false
        // 是否需要权限
        notificationActionOk.authenticationRequired = false
        // 启动app还是后台执行
        notificationActionOk.activationMode = UIUserNotificationActivationMode.Background
        
        let notificationActionRestNow: UIMutableUserNotificationAction = UIMutableUserNotificationAction()
        notificationActionRestNow.identifier = "relaxNow"
        notificationActionRestNow.title = "休息"
        notificationActionRestNow.destructive = false
        notificationActionRestNow.authenticationRequired = false
        notificationActionRestNow.activationMode = .Background
        
        // notification category设置
        let notificationCompleteCategory: UIMutableUserNotificationCategory = UIMutableUserNotificationCategory()
        notificationCompleteCategory.identifier = "COMPLETE_CATEGORY"
        notificationCompleteCategory.setActions([notificationActionOk, notificationActionRestNow], forContext: .Default)
        notificationCompleteCategory.setActions([notificationActionOk, notificationActionRestNow], forContext: .Minimal)
        
        // 请求用户允许通知
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Sound, .Alert, .Badge], categories: NSSet(array: [notificationCompleteCategory]) as? Set<UIUserNotificationCategory>))
        */
        
        
        /*
        注册简单本地通知
    
        application.registerUserNotificationSettings(UIUserNotificationSettings(forTypes: [.Sound, .Alert, .Badge], categories: nil))
        */
        
        return true
    }
    
    // 处理回复
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, withResponseInfo responseInfo: [NSObject : AnyObject], completionHandler: () -> Void) {
        if let response = responseInfo[UIUserNotificationActionResponseTypedTextKey] {
            let responseText = response as! String
                print("\(responseText)")
        }
        completionHandler()
    }
    
    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        UIApplication.sharedApplication().applicationIconBadgeNumber = 0
    }
    
    /*
    func application(application: UIApplication, handleActionWithIdentifier identifier: String?, forLocalNotification notification: UILocalNotification, completionHandler: () -> Void) {
        print("按下选项的identifier是: \(identifier)")
    }

    func application(application: UIApplication, didReceiveLocalNotification notification: UILocalNotification) {
        print("点击了通知")
    }
    */

}

