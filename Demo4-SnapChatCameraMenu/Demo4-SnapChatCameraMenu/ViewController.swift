//
//  ViewController.swift
//  Demo4-SnapChatCameraMenu
//
//  Created by 朱立焜 on 16/2/19.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var scrollView: UIScrollView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        UIApplication.sharedApplication().statusBarHidden = true
        
        self.setChildViewControllers()
        
        self.scrollView.contentSize = CGSizeMake(self.view.frame.width * 3, self.view.frame.size.height)
        
    }
    
    /**
     把三个子视图加到scrollView上, 再设置frame
     */
    func setChildViewControllers() {
        
        let leftView = LeftView(nibName: "LeftView", bundle: nil)
        let cameraView = CameraView(nibName: "CameraView", bundle: nil)
        let rightView = RightView(nibName: "RightView", bundle: nil)
        
        self.addChildViewController(leftView)
        self.scrollView.addSubview(leftView.view)
        leftView.didMoveToParentViewController(self)
        
        self.addChildViewController(cameraView)
        self.scrollView.addSubview(cameraView.view)
        cameraView.didMoveToParentViewController(self)
        
        self.addChildViewController(rightView)
        self.scrollView.addSubview(rightView.view)
        rightView.didMoveToParentViewController(self)
        
        // 设置frame
        var cameraViewFrame = cameraView.view.frame
        cameraViewFrame.origin.x = self.view.frame.width
        cameraView.view.frame = cameraViewFrame
        
        var rightViewFrame = rightView.view.frame
        rightViewFrame.origin.x = 2 * self.view.frame.width
        rightView.view.frame = rightViewFrame
        
    }
    

}

