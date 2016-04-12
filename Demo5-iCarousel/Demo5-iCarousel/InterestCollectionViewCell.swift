//
//  InterestCollectionViewCell.swift
//  Demo5-iCarousel
//
//  Created by 朱立焜 on 16/3/3.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

class InterestCollectionViewCell: UICollectionViewCell {
    
    var interest: Interest! {
        didSet {
            updateUI()
        }
    }
    
    @IBOutlet weak var featuredImageView: UIImageView!
    @IBOutlet weak var interestTitleLabel: UILabel!
    
    private func updateUI() {
        
        interestTitleLabel?.text! = interest.interestTitle
        featuredImageView?.image! = interest.interestFeaturedImage
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
    
}
