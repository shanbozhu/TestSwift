//
//  PBTestTwoController.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/8.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

class PBTestTwoController: UIViewController {

    override func viewDidLoad() {
        
        
        let btn : UIButton = UIButton(type: .custom)
        self.view.addSubview(btn)
        btn.frame = CGRect(x: 100, y: 200, width: 100, height: 100);
        btn.backgroundColor = UIColor.red
        btn.setTitle("点我跳转", for: UIControlState())
        btn.addTarget(self, action: #selector(PBTestTwoController.btnClick(_:)), for: .touchUpInside)
        
    }
    
    func btnClick(_ btn : UIButton) {
        print("点我跳转")
        
        print(btn)
        
        let testOneController = PBTestOneController()
        testOneController.hidesBottomBarWhenPushed = Bool(1)
        testOneController.view.backgroundColor = UIColor.white
        
        self.navigationController!.pushViewController(testOneController, animated: Bool(1));
    }
    
    
    func btnClick() {
        print("点我跳转")
        
        let testOneController = PBTestOneController()
        testOneController.hidesBottomBarWhenPushed = Bool(1)
        testOneController.view.backgroundColor = UIColor.white
        
        self.navigationController!.pushViewController(testOneController, animated: Bool(1));
    }
    
}
