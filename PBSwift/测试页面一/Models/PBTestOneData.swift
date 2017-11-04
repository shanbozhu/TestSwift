//
//  PBTestOneData.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/8.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit


class PBTestOneData: NSObject {
    
    var dynamic : [AnyObject]? //arr
    var artistList : [AnyObject]? //arr
    
    var dynamicAddIsNull : Bool = Bool(0)
    
    
    class func testOneData(_ dict : [String : AnyObject]) -> PBTestOneData {
        return PBTestOneData(dict : dict);
    }
    
    
    init(dict : [String : AnyObject]) {
        
        super.init()
        
        //所有键全部赋值
        self.setValuesForKeys(dict)
        

        //对赋值后的键所对应的值进行处理
        var objsDynamic = [PBTestOneDataDynamic]()
        for dic in self.dynamic! {
            
            let testOneDataDynamic = PBTestOneDataDynamic.testOneDataDynamic(dic as! [String : AnyObject])
            objsDynamic.append(testOneDataDynamic)
        }
        self.dynamic = objsDynamic
        
        
        //对赋值后的键所对应的值进行处理
        var objsArtistList = [PBTestOneDataArtistList]()
        if self.artistList != nil {
            
            for dic in self.artistList! {
                let testOneDataArtistList = PBTestOneDataArtistList.testOneDataArtistList(dic as! [String : AnyObject])
                objsArtistList.append(testOneDataArtistList)
            }
            self.artistList = objsArtistList
            
        }
        

    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        
    }
 
    
    
}
