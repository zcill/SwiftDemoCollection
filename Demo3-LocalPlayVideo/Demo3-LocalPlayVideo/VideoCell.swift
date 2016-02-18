//
//  VideoCell.swift
//  Demo3-LocalPlayVideo
//
//  Created by 朱立焜 on 16/2/18.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

struct video {
    
    let image: String
    let title: String
    let source: String
    
}

class VideoCell: UITableViewCell {
    
    
    @IBOutlet weak var videoImage: UIImageView!

    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
