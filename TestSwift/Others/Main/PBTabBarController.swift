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
        
        let attributesNormal = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor : UIColor.gray]
        let attributesSelected = [NSAttributedString.Key.font : UIFont.systemFont(ofSize: 10), NSAttributedString.Key.foregroundColor : UIColor.red]
        
        let vc1: PBTestTwoController = PBTestTwoController()
        vc1.title = "首页"
        vc1.view.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1)
        vc1.tabBarItem.image = UIImage(named: "indexA")?.withRenderingMode(.alwaysOriginal)
        vc1.tabBarItem.selectedImage = UIImage(named: "indexB")?.withRenderingMode(.alwaysOriginal)
        vc1.tabBarItem.imageInsets = UIEdgeInsets(top: -2, left: 0, bottom: 2, right: 0)
        vc1.tabBarItem.setTitleTextAttributes(attributesNormal, for: UIControl.State())
        vc1.tabBarItem.setTitleTextAttributes(attributesSelected, for: .selected)
        vc1.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        
        let vc2: UIViewController = UIViewController()
        vc2.title = "我的"
        vc2.view.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1)
        vc2.tabBarItem.image = UIImage(named: "squareA")?.withRenderingMode(.alwaysOriginal)
        vc2.tabBarItem.selectedImage = UIImage(named: "squareB")?.withRenderingMode(.alwaysOriginal)
        vc2.tabBarItem.imageInsets = UIEdgeInsets(top: -2, left: 0, bottom: 2, right: 0)
        vc2.tabBarItem.setTitleTextAttributes(attributesNormal, for: UIControl.State())
        vc2.tabBarItem.setTitleTextAttributes(attributesSelected, for: .selected)
        vc2.tabBarItem.titlePositionAdjustment = UIOffset(horizontal: 0, vertical: -2)
        
        self.viewControllers = [vc1, vc2]
    }
}
