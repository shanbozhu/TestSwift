//
//  PBTestOne.swift
//  TestSwift
//
//  Created by DaMaiIOS on 16/4/7.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

@objcMembers
class PBTestOne: NSObject {
    var errno: String?
    var errmsg: String?
    var ext: [String : Any]? // dict
    var extend: [String : Any]? // dict
    var data: [Any]? // arr
    var has_more: Int?
    var queryid: String?
    
    var extModel: PBTestOneExt?
    var dataAddIsNull: Bool = false
    
    class func testOne(_ dict: [String : Any]) -> PBTestOne {
        return PBTestOne(dict: dict)
    }
    
    init(dict: [String : Any]) {
        super.init();
        
        // 所有键全部赋值,所有键对应的值全部赋值给与键同名的成语变量
        self.setValuesForKeys(dict)
        
        // 特殊处理模型对象中数据类型为数组的成员变量
        var objsData = [PBTestOneData]()
        for dic in self.data! {
            let testOneData: PBTestOneData = PBTestOneData.testOneData(dic as? [String : Any] ?? [:])
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
