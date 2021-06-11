//
//  PBTestOneView.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/5.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

@objc
protocol PBTestOneViewDelegate: NSObjectProtocol {
    @objc optional func testOneView(_ testOneView: PBTestOneView)
    @objc optional func testOneView(_ testOneView: PBTestOneView, sinceId: Int, status: Int)
}

class PBTestOneView: UIView, UITableViewDelegate, UITableViewDataSource {
    @IBOutlet weak var tableView: UITableView!
    weak var delegate: PBTestOneViewDelegate?
    
    class func testOneView() -> PBTestOneView {
        return Bundle.main.loadNibNamed("PBTestOneView", owner: nil, options: nil)!.last as! PBTestOneView
    }
    
    override func awakeFromNib() {
        self.tableView.frame = CGRect(x: 0, y: PBCommonUIParams.navigationBarHeight(), width: sWidth, height: sHeight - PBCommonUIParams.navigationBarHeight())
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1)
        if #available(iOS 11.0, *) {
            self.tableView.contentInsetAdjustmentBehavior = UIScrollView.ContentInsetAdjustmentBehavior.never
        } else {
            // Fallback on earlier versions
        }
        
        // 开始刷新
        weak var weakSelf = self;
        let header = MJRefreshNormalHeader { () -> Void in
            weakSelf!.delegate!.testOneView!(weakSelf!, sinceId: 0, status: 0)
        }
        header?.lastUpdatedTimeLabel!.isHidden = true
        self.tableView.header = header
        
        self.tableView.footer = MJRefreshAutoNormalFooter(refreshingBlock: { () -> Void in
            let testOneData: PBTestOneData = weakSelf!.testOne!.data!.last as! PBTestOneData
            testOneData.sortTime = 1000
            weakSelf!.delegate!.testOneView!(weakSelf!, sinceId: testOneData.sortTime, status: 1)
        })
    }
    
    var testOne: PBTestOne? {
        willSet {
            
        }
        
        // set(默认执行 中间的set方法用来 保存成私有成员变量,同时增加一个强指针)
        
        didSet {
            self.tableView.reloadData()
            
            // 结束刷新
            self.tableView.header.endRefreshing()
            if self.testOne!.dynamicAddIsNull == true {
                self.tableView.footer.noticeNoMoreData()
            } else {
                self.tableView.footer.endRefreshing()
            }
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        if let testOne = self.testOne {
            return testOne.data!.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let testOneData: PBTestOneData = self.testOne!.data![indexPath.row] as! PBTestOneData
        if testOneData.cellHeight == 0 {
            let cell = self.tableView(self.tableView, cellForRowAt: indexPath)
            cell.removeFromSuperview()
            return cell.frame.height
        } else {
            return testOneData.cellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: PBTestOneCell = PBTestOneCell.testOneCell(tableView)
        let testOneData: PBTestOneData = self.testOne!.data![indexPath.row] as! PBTestOneData
        cell.testOneData = testOneData
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        self.delegate!.testOneView!(self)
    }
    
    deinit {
        print("PBTestOneView对象被释放了")
    }
}

