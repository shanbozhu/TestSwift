//
//  PBTestOneDataDynamic.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/8.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

class PBTestOneDataDynamic: NSObject {
    var content: String?
    var isSupport: Int = 0
    var type: Int = 0
    var title: String?
    var sourceId: Int = 0
    var sortTime: Int = 0
    var dynamicTime: Int = 0
    var favorCount: Int = 0
    var socialType: Int = 0
    var statusId: Int = 0
    var artId: Int = 0
    var img2: [String]?
    var replyCount: Int = 0
    var maitianId: Int = 0
    var cellHeight: CGFloat = 0
    
    class func testOneDataDynamic(_ dict: [String : AnyObject]) -> PBTestOneDataDynamic {
        return PBTestOneDataDynamic(dict: dict)
    }
    
    init(dict: [String : AnyObject]) {
        super.init()
        
        // 所有键全部赋值
        self.setValuesForKeys(dict)
        
        // 手动写死图片地址
        img2 = ["http://imgsrc.baidu.com/baike/pic/item/3bf33a87e950352a344d78d55643fbf2b2118b3b.jpg"]
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
