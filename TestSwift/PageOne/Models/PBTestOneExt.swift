//
//  PBTestOneExt.swift
//  TestSwift
//
//  Created by Zhu,Shanbo on 2021/6/10.
//  Copyright © 2021 DaMaiIOS. All rights reserved.
//

import UIKit

@objcMembers
class PBTestOneExt: NSObject {
    var hot_header_title: String?
    
    class func testOneExt(_ dict: [String : Any]) -> PBTestOneExt {
        return PBTestOneExt(dict: dict)
    }
    
    init(dict: [String : Any]) {
        super.init()
        
        // 所有键全部赋值
        self.setValuesForKeys(dict)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
