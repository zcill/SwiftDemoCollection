//
//  ViewController.swift
//  Project3-Swift iAd
//
//  Created by 朱立焜 on 16/4/12.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Build an iAd Banner
// - Work with Ad Banner View
// - Handle ads that don't load
// - Use Constrains to pin iAd Banners at the bottom for portrait and landscape views

import UIKit
import iAd

class ViewController: UIViewController, ADBannerViewDelegate {

    @IBOutlet weak var bannerView: ADBannerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        bannerView.delegate = self
        bannerView.hidden = true
        
    }
    
    func bannerViewDidLoadAd(banner: ADBannerView!) {
        bannerView.hidden = false
    }
    
    func bannerView(banner: ADBannerView!, didFailToReceiveAdWithError error: NSError!) {
        print(error.description)
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

