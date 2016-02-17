//
//  ViewController.swift
//  Demo1-stopWatch
//
//  Created by 朱立焜 on 16/2/16.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    var counter = 0.0
    var timer = NSTimer()
    var isPlaying = false
    
    override func preferredStatusBarStyle() -> UIStatusBarStyle {
        return UIStatusBarStyle.LightContent
    }
    
    override func viewDidLoad() {
        timeLabel.text = String(counter)
        super.viewDidLoad()
    }
    
    @IBOutlet weak var timeLabel: UILabel!
    
    @IBAction func resetTime(sender: UIButton) {
        timer.invalidate()
        isPlaying = false
        counter = 0.0
        timeLabel.text = String(counter)
    }
    
    @IBAction func playTime(sender: UIButton) {
        if isPlaying {
            return
        }
        timer = NSTimer.scheduledTimerWithTimeInterval(0.1, target: self, selector: Selector("UpdateTime"), userInfo: nil, repeats: true)
        isPlaying = true
    }

    @IBAction func pauseTime(sender: UIButton) {
        timer.invalidate()
        isPlaying = false
    }
    
    func UpdateTime() {
        counter = counter + 0.1
        timeLabel.text = String(format: "%.1f", counter)
    }

}

