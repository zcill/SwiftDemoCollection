//
//  Model.swift
//  Project12-Add New Item
//
//  Created by 朱立焜 on 16/4/14.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

import UIKit

class Model: NSObject {
    
    var name: String?
    
    // 定义closure
    typealias funcBlock = (backMsg: String) -> ()
    
    var blockproperty: funcBlock!
    
    func processMethod(cmdStr: String) {
        if let _ = blockproperty {
            blockproperty(backMsg: "backMsg --- by block property")
        }
    }
    
}
