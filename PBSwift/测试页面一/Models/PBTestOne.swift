//
//  PBTestOne.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/7.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

class PBTestOne: NSObject {
    
    var data : [String : AnyObject]? //dict
    var code : Int = 0
    var dataModel : PBTestOneData?
    
    class func testOne(_ dict : [String : AnyObject]) -> PBTestOne {
        return PBTestOne(dict: dict)
    }
    
    init(dict : [String : AnyObject]) {
        super.init();
        
        // 所有键全部赋值
        self.setValuesForKeys(dict);
        
        // 对赋值后的键所对应的值进行处理
        if let data = self.data {
            let testOneData : PBTestOneData = PBTestOneData.testOneData(data)
            self.dataModel = testOneData
        }
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
