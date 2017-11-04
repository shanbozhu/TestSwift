//
//  PBTestOneController.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/5.
//  Copyright © 2016年 朱善波. All rights reserved.
//



import UIKit

let sWidth : CGFloat = UIScreen.main.bounds.size.width;
let sHeight : CGFloat = UIScreen.main.bounds.size.height;

//完善类的过程
class PBTestOneController: UIViewController, PBTestOneViewDelegate {

    weak var testOneView : PBTestOneView?
    
    func requestData(_ sinceId : Int, status : Int) {
        
        //等待视图
        let loadingView = UIButton(type: .custom)
        self.view.addSubview(loadingView)
        loadingView.frame = CGRect(x: (sWidth-100)/2, y: (sHeight-100)/2, width: 100, height: 100)
        loadingView.setTitle("正在加载...", for: UIControlState())
        loadingView.backgroundColor = UIColor.gray
        loadingView.isHidden = Bool(0)
        
        print("\(sinceId)")

        //最开始要能把从网络下载的原始 json字符串 序列化为 json字典
        
        let requestUrl = "http://mtapi.damai.cn/mt/social/weiBoList"
        
        var paras = [String : AnyObject]()
        paras["loginKey"] = "8546da3e-524f-4f49-86ac-5f3235e203ad" as AnyObject?;
        paras["maitianId"] = "36"as AnyObject?;
        paras["sinceId"] = "\(sinceId)"as AnyObject?;
        paras["pageSize"] = "20"as AnyObject?;
        paras["artistId"] = "0"as AnyObject?;
        
        var parasTwo = [String : AnyObject]()
        parasTwo["json"] = self.stringWithDictionary(paras) as AnyObject?

        weak var weakSelf = self
        let manager : AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        //将返回的json字典序列化为二进制数据
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.post(requestUrl, parameters: parasTwo, success: { (operation:AFHTTPRequestOperation?, responseObject:Any?) in
            
            
            
            
            
            let jsonDict : [String : AnyObject] = try! JSONSerialization.jsonObject(with: (responseObject as! NSData) as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : AnyObject]
            
            
            let jsonStr = weakSelf!.stringWithDictionary(jsonDict)
            print("jsonStr = \(jsonStr)")
            
            
            
            //封装模型(把字典封装成模型)
            let testOne = PBTestOne.testOne(jsonDict)
            
            if testOne.code == 200 {
                
                
                
                //加载模型(把模型加载到控制器)
                if status == 0 {
                    
                    weakSelf!.testOneView!.testOne = testOne
                    
                } else {
                    
                    
                    
                    
                    var objs : [AnyObject] = [AnyObject]()
                    objs += weakSelf!.testOneView!.testOne!.dataModel!.dynamic!
                    objs += testOne.dataModel!.dynamic!
                    
                    print("objs = \(objs)")
                    print("objs.count = \(objs.count)")
                    
                    if testOne.dataModel!.dynamic!.count == 0 {
                        weakSelf!.testOneView!.testOne!.dataModel!.dynamicAddIsNull = Bool(1)
                    }
                    
                    
                    weakSelf!.testOneView!.testOne!.dataModel!.dynamic = objs
                    weakSelf!.testOneView!.testOne = weakSelf!.testOneView!.testOne
                }
                
                
                
                
                
                
                
                
                
                
            }
            
            
            
            weakSelf!.testOneView!.isHidden = Bool(0)
            
            
            loadingView.removeFromSuperview()
            loadingView.isHidden = Bool(1)
            
            
            
            
            
        }) { (operation :AFHTTPRequestOperation?, error:Error?) in
            print(error!)
        }
        
        
        
        
    }
    
    
    //控制器的默认视图加载完毕之后会调用此方法
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        //加载视图(把视图加载到控制器)
        //let testOneView : PBTestOneView = PBTestOneView(frame : CGRectZero);
        //let testOneView : PBTestOneView = PBTestOneView.init(frame: CGRectZero);
        let testOneView : PBTestOneView = PBTestOneView.testOneView();
        self.testOneView = testOneView;
        self.view.addSubview(testOneView);
        testOneView.frame = self.view.bounds;
        testOneView.backgroundColor = UIColor.white;
        testOneView.isHidden = Bool(1)
        
        testOneView.delegate = self
        
        
        //填充视图(把模型填充到视图)
        self.requestData(0, status: 0)
    }

    
    func testOneView(_ testOneView: PBTestOneView) {
        print("我被点击了")
        
        let vc : UIViewController = UIViewController()
        vc.hidesBottomBarWhenPushed = Bool(1)
        vc.view.backgroundColor = UIColor.white
        
        self.navigationController!.pushViewController(vc, animated:Bool(1))
    }
    
    func testOneView(_ testOneView: PBTestOneView, sinceId: Int, status: Int) {
        print("i am here")
        
        self.requestData(sinceId, status: status)
    }
    
    
    
    
    
    deinit {
        print("PBTestOneController对象被释放了")
    }
        
        
    
    
    
        
    
    
    
    
    
    
    
    
    func stringWithDictionary(_ jsonDict : [String : AnyObject]) -> String {
        let data : Data = try! JSONSerialization.data(withJSONObject: jsonDict, options: JSONSerialization.WritingOptions.prettyPrinted)
        
        return String(data:data, encoding:String.Encoding.utf8)!
    }
    
    func dictionaryWithString(_ jsonStr : String) -> [String : AnyObject] {
        let data : Data = jsonStr.data(using: String.Encoding.utf8)!
        
        let jsonDict : [String : AnyObject] = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : AnyObject]
        return jsonDict
    }

}


