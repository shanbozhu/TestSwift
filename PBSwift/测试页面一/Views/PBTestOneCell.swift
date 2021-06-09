//
//  PBTestOneCell.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/8.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

class PBTestOneCell: UITableViewCell {
    weak var oneLab: TTTAttributedLabel?
    weak var twoLab: TTTAttributedLabel?
    weak var oneImageView: UIImageView?
    weak var twoImageView: UIImageView?
    weak var oneView: UIView?
    
    class func testOneCell(_ tableView: UITableView) -> PBTestOneCell {
        tableView.register(PBTestOneCell.self, forCellReuseIdentifier: "PBTestOneCell")
        let cell: PBTestOneCell = tableView.dequeueReusableCell(withIdentifier: "PBTestOneCell") as! PBTestOneCell
        return cell
    }
    
    override init(style: UITableViewCellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        // 图标
        let oneImageView: UIImageView = UIImageView.init()
        self.oneImageView = oneImageView
        self.contentView.addSubview(oneImageView)
        
        // 昵称
        let oneLab: TTTAttributedLabel = TTTAttributedLabel(frame: CGRect.zero)
        self.oneLab = oneLab
        self.contentView.addSubview(oneLab)
        
        // 内容
        let twoLab: TTTAttributedLabel = TTTAttributedLabel(frame: CGRect.zero)
        self.twoLab = twoLab
        self.contentView.addSubview(twoLab)
        
        // 图片
        let twoImageView: UIImageView = UIImageView()
        self.twoImageView = twoImageView
        self.contentView.addSubview(twoImageView)
        
        // 分割线
        let oneView: UIView = UIView()
        self.oneView = oneView
        self.contentView.addSubview(oneView)
    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    var testOneDataDynamic: PBTestOneDataDynamic? {
        willSet {
            
        }
        
        //set(默认执行 中间的set方法用来 保存成私有成员变量,同时增加一个强指针)
        
        didSet {
            self.fillTestOneCell()
        }
    }
    
    func fillTestOneCell() {
        // 图标
        self.oneImageView!.frame = CGRect(x: 18, y: 10, width: 40, height: 40);
        if let image = UIImage(named:"test") {
            self.oneImageView!.image = image;
        }
        
        // 昵称
        self.oneLab!.textColor = UIColor(red: 68.0/255, green: 93.0/255, blue: 123.0/255, alpha: 1)
        self.oneLab!.numberOfLines = 2;
        self.oneLab!.font = UIFont.boldSystemFont(ofSize: 15)
        self.oneLab!.frame = CGRect(x: 68, y: 12, width: sWidth-68-20, height: 0);
        self.oneLab!.text = self.testOneDataDynamic!.title;
        self.oneLab!.sizeToFit();
        //self.oneLab!.backgroundColor = UIColor.grayColor();
        
        // 内容
        self.twoLab!.textColor = UIColor(white: 0, alpha: 1)
        //self.twoLab!.lineSpacing = 5
        self.twoLab!.numberOfLines = 0;
        self.twoLab!.font = UIFont.systemFont(ofSize: 16);
        self.twoLab!.frame = CGRect(x: 68, y: (self.oneLab!.frame).maxY+10, width: sWidth-68-20, height: 0);
        self.twoLab!.text = self.testOneDataDynamic!.content
        self.twoLab!.sizeToFit()
        //self.twoLab!.backgroundColor = UIColor.redColor()
        
        // 图片
        self.twoImageView!.contentMode = .scaleAspectFill;
        self.twoImageView!.clipsToBounds = true;
        self.twoImageView!.backgroundColor = UIColor.blue;
        if self.testOneDataDynamic!.img2!.count > 0 {
            self.twoImageView!.frame = CGRect(x: 68, y: (self.twoLab!.frame).maxY+10, width: 120, height: 120)
            self.twoImageView!.sd_setImage(with: URL(string: self.testOneDataDynamic!.img2![0]), placeholderImage: UIImage(named: "zhanwei"))
            self.twoImageView!.isHidden = false
        } else {
            self.twoImageView!.frame = CGRect(x: 68, y: (self.twoLab!.frame).maxY, width: 0, height: 0)
            self.twoImageView!.isHidden = true
        }
        
        // 分割线
        self.oneView!.frame = CGRect(x: 0, y: self.twoImageView!.frame.maxY+10, width: sWidth, height: 0.5)
        self.oneView!.backgroundColor = UIColor(white: 0, alpha: 0.1)
        
        // 设置自定义视图frame高度
        var rect : CGRect = self.frame
        rect.size.height = self.oneView!.frame.maxY
        self.frame = rect
        self.testOneDataDynamic!.cellHeight = self.frame.size.height
    }
    
    deinit {
        print("PBTestOneCell对象被释放了")
    }
}
