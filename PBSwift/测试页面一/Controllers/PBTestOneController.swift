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

// 完善类的过程
class PBTestOneController: UIViewController, PBTestOneViewDelegate {

    weak var testOneView : PBTestOneView?
    
    func requestData(_ sinceId : Int, status : Int) {
        // 等待视图
        let loadingView = UIButton(type: .custom)
        self.view.addSubview(loadingView)
        loadingView.frame = CGRect(x: (sWidth-100)/2, y: (sHeight-100)/2, width: 100, height: 100)
        loadingView.setTitle("正在加载...", for: UIControlState())
        loadingView.backgroundColor = UIColor.gray
        loadingView.isHidden = false
        
        print("\(sinceId)")

        // 最开始要能把从网络下载的原始 json字符串 序列化为 json字典
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
        // 将返回的json字典序列化为二进制数据
        manager.responseSerializer = AFHTTPResponseSerializer()
        manager.post(requestUrl, parameters: parasTwo, success: { (operation:AFHTTPRequestOperation?, responseObject:Any?) in
            let jsonDict : [String : AnyObject] = try! JSONSerialization.jsonObject(with: (responseObject as! NSData) as Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : AnyObject]
            
            let jsonStr = weakSelf!.stringWithDictionary(jsonDict)
            print("jsonStr = \(jsonStr)")
            
            // 封装模型(把字典封装成模型)
            let testOne = PBTestOne.testOne(jsonDict)
            
            if testOne.code == 200 {
                // 加载模型(把模型加载到控制器)
                if status == 0 {
                    weakSelf!.testOneView!.testOne = testOne
                } else {
                    var objs : [AnyObject] = [AnyObject]()
                    objs += weakSelf!.testOneView!.testOne!.dataModel!.dynamic!
                    objs += testOne.dataModel!.dynamic!
                    
                    print("objs = \(objs)")
                    print("objs.count = \(objs.count)")
                    
                    if testOne.dataModel!.dynamic!.count == 0 {
                        weakSelf!.testOneView!.testOne!.dataModel!.dynamicAddIsNull = true
                    }
                    
                    weakSelf!.testOneView!.testOne!.dataModel!.dynamic = objs
                    weakSelf!.testOneView!.testOne = weakSelf!.testOneView!.testOne
                }
            }
            weakSelf!.testOneView!.isHidden = false
            
            loadingView.removeFromSuperview()
            loadingView.isHidden = true
        }) { (operation :AFHTTPRequestOperation?, error:Error?) in
            print(error!)
        }
        
        
        // 最开始要能把从本地加载的原始 json字符串 序列化为 json字典
        
        // 1.网络下载的原始 json字符串
        let jsonStr : NSString = "{\"data\" : {\"dynamic\" : [{\"content\" : \"最近两天貌似进入了蘑菇期，你们说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊呗。[阴险][偷乐] #李宇春#\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 288757,\"sortTime\" : 1460021145000,\"dynamicTime\" : 1460021145000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3961678180208127\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊你们说会长又悄悄干嘛去了呢？[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？最近两天貌似进入了蘑菇期，你们说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊呗。[阴险][偷乐] #李宇春#\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 288757,\"sortTime\" : 1460021145000,\"dynamicTime\" : 1460021145000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3961678180208127\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"最近两天貌似进入了蘑菇期，你们说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊呗。你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？[阴险][偷乐] #李宇春#\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 288757,\"sortTime\" : 1460021145000,\"dynamicTime\" : 1460021145000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3961678180208127\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"最近两天貌似进入了蘑菇期，你们似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊呗。[阴险][偷乐] #李宇春#\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 288757,\"sortTime\" : 1460021145000,\"dynamicTime\" : 1460021145000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3961678180208127\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6}],\"artistList\" : [{\"artistId\" : 67,\"name\" : \"李宇春\"},{\"artistId\" : 197,\"name\" : \"李宇春疯狂工作室\"}]},\"code\" : 200}"
        
        // 字符串先转化为二进制数据作为中转
        let data : Data = jsonStr.data(using: 4)!
        //let data : NSData = jsonStr.dataUsingEncoding(NSUTF8StringEncoding)!
        
        // 2.序列化为 json字典
        let jsonDict : [String : AnyObject] = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : AnyObject]
        
        // 封装模型(把字典封装成模型)
        let testOne = PBTestOne.testOne(jsonDict)
        
        // 加载模型(把模型加载到控制器)
        self.testOneView!.testOne = testOne
        
        self.testOneView!.isHidden = false
        loadingView.isHidden = true
    }
    
    // 控制器的默认视图加载完毕之后会调用此方法
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 加载视图(把视图加载到控制器)
        //let testOneView : PBTestOneView = PBTestOneView(frame : CGRectZero);
        //let testOneView : PBTestOneView = PBTestOneView.init(frame: CGRectZero);
        let testOneView : PBTestOneView = PBTestOneView.testOneView();
        self.testOneView = testOneView;
        self.view.addSubview(testOneView);
        testOneView.frame = self.view.bounds;
        testOneView.backgroundColor = UIColor.white;
        testOneView.isHidden = true
        
        testOneView.delegate = self
        
        // 填充视图(把模型填充到视图)
        self.requestData(0, status: 0)
    }

    func testOneView(_ testOneView: PBTestOneView) {
        print("我被点击了")
        
        let vc : UIViewController = UIViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.view.backgroundColor = UIColor.white
        
        self.navigationController!.pushViewController(vc, animated:true)
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
