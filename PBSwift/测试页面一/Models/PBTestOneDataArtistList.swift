//
//  PBTestOneDataArtistList.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/8.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

class PBTestOneDataArtistList: NSObject {

    var artistId : Int = 0
    var name : String?
    
    class func testOneDataArtistList(_ dict : [String : AnyObject]) -> PBTestOneDataArtistList {
        return PBTestOneDataArtistList(dict : dict);
    }
    
    init(dict : [String : AnyObject]) {
        super.init()
        
        self.setValuesForKeys(dict);
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
}
