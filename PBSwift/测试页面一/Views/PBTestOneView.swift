//
//  PBTestOneView.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/5.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

@objc
protocol PBTestOneViewDelegate : NSObjectProtocol {
    @objc optional func testOneView(_ testOneView : PBTestOneView)
    @objc optional func testOneView(_ testOneView : PBTestOneView, sinceId : Int, status : Int)
}

//xib
class PBTestOneView: UIView, UITableViewDelegate, UITableViewDataSource {
    
//    //刷新
//    enum RefreshStatus {
//        RefreshStatusHeader,
//        RefreshStatusFooter,
//        RefreshStatusNor
//    };
//    typedef enum RefreshStatus RefreshStatus;
    
    @IBOutlet weak var tableView: UITableView!
    
    //待研究下
    weak var delegate : PBTestOneViewDelegate?
    
    //调用无限次
    class func testOneView() -> PBTestOneView {
        return Bundle.main.loadNibNamed("PBTestOneView", owner: nil, options: nil)!.last as! PBTestOneView
    }
    
    //加载视图(使用xib) 调用有限次,至多满屏次
    override func awakeFromNib() {
        self.tableView.frame = CGRect(x: 0, y: 0, width: sWidth, height: sHeight)
        self.tableView.delegate = self
        self.tableView.dataSource = self
        self.tableView.separatorStyle = .none
        self.tableView.backgroundColor = UIColor(red: 244.0/255, green: 244.0/255, blue: 244.0/255, alpha: 1)
        
        //开始刷新
        weak var weakSelf = self;
        let header = MJRefreshNormalHeader { () -> Void in
            weakSelf!.delegate!.testOneView!(weakSelf!, sinceId: 0, status: 0)
        }
        header?.lastUpdatedTimeLabel!.isHidden = true
        self.tableView.header = header
        
        self.tableView.footer = MJRefreshAutoNormalFooter(refreshingBlock: { () -> Void in
            let dynamic : PBTestOneDataDynamic = weakSelf!.testOne!.dataModel!.dynamic!.last as! PBTestOneDataDynamic
            weakSelf!.delegate!.testOneView!(weakSelf!, sinceId: dynamic.sortTime, status: 1)
        })
    }
    
    //属性传值,相当于oc中的重写setter方法 调用无限次
    var testOne : PBTestOne? {
        willSet {
            
        }
        
        //set(默认执行 中间的set方法用来 保存成私有成员变量,同时增加一个强指针)
        
        didSet {
            self.tableView.reloadData()
            
            //结束刷新
            self.tableView.header.endRefreshing()
            if self.testOne!.dataModel!.dynamicAddIsNull == true {
                self.tableView.footer.noticeNoMoreData()
            } else {
                self.tableView.footer.endRefreshing()
            }
        }
    }
    
    //tableView的数据源方法和代理方法
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        
        if let testOne = self.testOne {
            return testOne.dataModel!.dynamic!.count
        } else {
            return 0;
        }
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        let dynamic : PBTestOneDataDynamic = self.testOne!.dataModel!.dynamic![indexPath.row] as! PBTestOneDataDynamic
        if dynamic.cellHeight == 0 {
            let cell = self.tableView(self.tableView, cellForRowAt: indexPath)
            cell.removeFromSuperview()
            return cell.frame.height
        } else {
            return dynamic.cellHeight
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        let cell : PBTestOneCell = PBTestOneCell.testOneCell(tableView);
        
        //cell.testOneDataDynamic = self.testOne!.dataModel!.dynamic![indexPath.row] as? PBTestOneDataDynamic
        
        let dynamic : PBTestOneDataDynamic = self.testOne!.dataModel!.dynamic![indexPath.row] as! PBTestOneDataDynamic
        cell.testOneDataDynamic = dynamic
        
        //cell.testOneDataDynamic = (self.testOne!.dataModel!.dynamic![indexPath.row] as! PBTestOneDataDynamic)
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView .deselectRow(at: indexPath, animated: true)
        self.delegate!.testOneView!(self)
    }
    
    deinit {
        print("PBTestOneView对象被释放了")
    }
}

