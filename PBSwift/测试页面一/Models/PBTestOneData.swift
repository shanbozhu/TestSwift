//
//  PBTestOneData.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/8.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

@objcMembers
class PBTestOneData: NSObject {
    var ext: String?
    var query: String?
    var type: String?
    var wap_url: String?
    var word: String?
    var www_url: String?
    
    var img2: [String]?
    var sortTime: Int = 0
    var cellHeight: CGFloat = 0
    
    class func testOneData(_ dict: [String : AnyObject]) -> PBTestOneData {
        return PBTestOneData(dict: dict)
    }
    
    init(dict: [String : AnyObject]) {
        super.init()
        
        // 所有键全部赋值
        self.setValuesForKeys(dict)
        
        self.img2 = ["http://imgsrc.baidu.com/baike/pic/item/3bf33a87e950352a344d78d55643fbf2b2118b3b.jpg"]
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
