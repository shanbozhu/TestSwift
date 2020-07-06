//
//  PBTabBarController.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/15.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

class PBTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attributesNormal = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10), NSAttributedStringKey.foregroundColor : UIColor.gray]
        let attributesSelected = [NSAttributedStringKey.font : UIFont.systemFont(ofSize: 10), NSAttributedStringKey.foregroundColor : UIColor.red]
        
        let vc1 : PBTestTwoController = PBTestTwoController()
        vc1.title = "首页"
        vc1.view.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1)
        vc1.tabBarItem.image = UIImage(named: "indexA")!.withRenderingMode(.alwaysOriginal)
        vc1.tabBarItem.selectedImage = UIImage(named: "indexB")!.withRenderingMode(.alwaysOriginal)
        vc1.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
        vc1.tabBarItem.setTitleTextAttributes(attributesNormal, for: UIControlState())
        vc1.tabBarItem.setTitleTextAttributes(attributesSelected, for: .selected)
        vc1.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        
        let vc2 : UIViewController = UIViewController()
        vc2.title = "广场"
        vc2.view.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1)
        vc2.tabBarItem.image = UIImage(named: "squareA")!.withRenderingMode(.alwaysOriginal)
        vc2.tabBarItem.selectedImage = UIImage(named: "squareB")!.withRenderingMode(.alwaysOriginal)
        vc2.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
        vc2.tabBarItem.setTitleTextAttributes(attributesNormal, for: UIControlState())
        vc2.tabBarItem.setTitleTextAttributes(attributesSelected, for: .selected)
        vc2.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        
        let vc3 : UIViewController = UIViewController()
        vc3.title = "活动"
        vc3.view.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1)
        vc3.tabBarItem.image = UIImage(named: "exerciseA")!.withRenderingMode(.alwaysOriginal)
        vc3.tabBarItem.selectedImage = UIImage(named: "exerciseB")!.withRenderingMode(.alwaysOriginal)
        vc3.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
        vc3.tabBarItem.setTitleTextAttributes(attributesNormal, for: UIControlState())
        vc3.tabBarItem.setTitleTextAttributes(attributesSelected, for: .selected)
        vc3.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        
        let vc4 : UIViewController = UIViewController()
        vc4.title = "我的"
        vc4.view.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1)
        vc4.tabBarItem.image = UIImage(named: "mineA")!.withRenderingMode(.alwaysOriginal)
        vc4.tabBarItem.selectedImage = UIImage(named: "mineB")!.withRenderingMode(.alwaysOriginal)
        vc4.tabBarItem.imageInsets = UIEdgeInsetsMake(-2, 0, 2, 0)
        vc4.tabBarItem.setTitleTextAttributes(attributesNormal, for: UIControlState())
        vc4.tabBarItem.setTitleTextAttributes(attributesSelected, for: .selected)
        vc4.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -2)
        
        self.viewControllers = [vc1, vc2, vc3, vc4];
    }
}
