//
//  PBTestOne.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/7.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

@objcMembers
class PBTestOne: NSObject {
    var errno: String?
    var errmsg: String?
    var ext: [String : AnyObject]? // dict
    var extend: [String : AnyObject]? // dict
    var data: [AnyObject]? // arr
    var has_more: Int?
    var queryid: String?
    var extModel: PBTestOneExt?
    
    var dynamicAddIsNull: Bool = false
    
    class func testOne(_ dict: [String : AnyObject]) -> PBTestOne {
        return PBTestOne(dict: dict)
    }
    
    init(dict: [String : AnyObject]) {
        super.init();
        
        // 所有键全部赋值
        self.setValuesForKeys(dict)
        
        // 对赋值后的键所对应的值进行处理
        var objsData = [PBTestOneData]()
        for dic in self.data! {
            let testOneData: PBTestOneData = PBTestOneData.testOneData(dic as! [String : AnyObject])
            objsData.append(testOneData)
        }
        self.data = objsData
        
        if let ext = self.ext {
            let testOneExt: PBTestOneExt = PBTestOneExt.testOneExt(ext)
            self.extModel = testOneExt
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
