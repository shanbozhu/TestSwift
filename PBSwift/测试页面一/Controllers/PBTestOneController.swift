//
//  PBTestOneController.swift
//  swift2016.04.05
//
//  Created by DaMaiIOS on 16/4/5.
//  Copyright © 2016年 朱善波. All rights reserved.
//

import UIKit

let sWidth: CGFloat = UIScreen.main.bounds.size.width
let sHeight: CGFloat = UIScreen.main.bounds.size.height

class PBTestOneController: UIViewController, PBTestOneViewDelegate {
    weak var testOneView: PBTestOneView?
    
    func requestData(_ sinceId: Int, status: Int) {
        print("\(sinceId)")

        let requestUrl = "https://m.baidu.com/recsys/hisproxy/data/usrhistory?page=0"

        let manager: AFHTTPRequestOperationManager = AFHTTPRequestOperationManager()
        manager.requestSerializer = AFHTTPRequestSerializer()
        manager.responseSerializer = AFHTTPResponseSerializer()
        
        let paras = self.requestHeaderAndBody(manager: manager)
        
        weak var weakSelf = self
        manager.post(requestUrl, parameters: paras, success: { (operation:AFHTTPRequestOperation?, responseObject:Any?) in
            let jsonDict : [String : AnyObject] = try! JSONSerialization.jsonObject(with: responseObject as! Data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : AnyObject]
            
            let jsonStr = weakSelf!.stringWithDictionary(jsonDict)
            
            // 把字典封装成模型
            let testOne = PBTestOne.testOne(jsonDict)

            if testOne.code == 200 {
                // 把模型填充到视图
                if status == 0 {
                    weakSelf!.testOneView!.testOne = testOne
                } else {
                    var objs : [AnyObject] = [AnyObject]()
                    objs += weakSelf!.testOneView!.testOne!.dataModel!.dynamic!
                    objs += testOne.dataModel!.dynamic!

                    print("objs = \(objs)")

                    if testOne.dataModel!.dynamic!.count == 0 {
                        weakSelf!.testOneView!.testOne!.dataModel!.dynamicAddIsNull = true
                    }

                    weakSelf!.testOneView!.testOne!.dataModel!.dynamic = objs
                    weakSelf!.testOneView!.testOne = weakSelf!.testOneView!.testOne
                }
            }
            weakSelf!.testOneView!.isHidden = false
        }) { (operation :AFHTTPRequestOperation?, error:Error?) in
            print(error!)
        }
        
        
        let jsonStr: String = "{\"data\" : {\"dynamic\" : [{\"content\" : \"最近两天貌似进入了蘑菇期，你们说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊呗。[阴险][偷乐] #李宇春#\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 288757,\"sortTime\" : 1460021145000,\"dynamicTime\" : 1460021145000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3961678180208127\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊[思考]大伙儿一起来聊聊你们说会长又悄悄干嘛去了呢？[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？最近两天貌似进入了蘑菇期，你们说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊呗。[阴险][偷乐] #李宇春#\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 288757,\"sortTime\" : 1460021145000,\"dynamicTime\" : 1460021145000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3961678180208127\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"最近两天貌似进入了蘑菇期，你们说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊呗。你们说会长又悄悄干嘛去了呢？你们说会长又悄悄干嘛去了呢？[阴险][偷乐] #李宇春#\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 288757,\"sortTime\" : 1460021145000,\"dynamicTime\" : 1460021145000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3961678180208127\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"最近两天貌似进入了蘑菇期，你们似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又说会长又悄悄干嘛去了呢？[思考]大伙儿一起来聊聊呗。[阴险][偷乐] #李宇春#\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 288757,\"sortTime\" : 1460021145000,\"dynamicTime\" : 1460021145000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3961678180208127\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6},{\"content\" : \"爱你，么么哒，似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又似进入了蘑菇期，你们说会长又晚安，好梦。[心]\",\"isSupport\" : 0,\"type\" : 4,\"title\" : \"李宇春疯狂工作室\",\"sourceId\" : 286715,\"sortTime\" : 1459695876000,\"dynamicTime\" : 1459695876000,\"favorCount\" : 0,\"socialType\" : 4,\"statusId\" : \"3960313902310751\",\"artId\" : \"2723838314\",\"img2\" : [],\"replyCount\" : 0,\"maitianId\" : 6}],\"artistList\" : [{\"artistId\" : 67,\"name\" : \"李宇春\"},{\"artistId\" : 197,\"name\" : \"李宇春疯狂工作室\"}]},\"code\" : 200}"
        
        let data: Data = jsonStr.data(using: String.Encoding.utf8)!
        let jsonDict: [String : AnyObject] = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : AnyObject]
        
        // 2.把字典封装成模型
        let testOne = PBTestOne.testOne(jsonDict)
        
        // 3.把模型填充到视图
        self.testOneView!.testOne = testOne
        self.testOneView!.isHidden = false
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 1.把视图加载到控制器
        let testOneView: PBTestOneView = PBTestOneView.testOneView()
        self.testOneView = testOneView
        self.view.addSubview(testOneView)
        testOneView.frame = self.view.bounds
        testOneView.backgroundColor = UIColor.white
        testOneView.isHidden = true
        testOneView.delegate = self
        
        self.requestData(0, status: 0)
    }

    func testOneView(_ testOneView: PBTestOneView) {
        print("我被点击了")
        
        let vc: UIViewController = UIViewController()
        vc.hidesBottomBarWhenPushed = true
        vc.view.backgroundColor = UIColor.white
        
        self.navigationController!.pushViewController(vc, animated:true)
    }
    
    func testOneView(_ testOneView: PBTestOneView, sinceId: Int, status: Int) {
        print("refresh")
        self.requestData(sinceId, status: status)
    }
    
    deinit {
        print("PBTestOneController对象被释放了")
    }
    
    func requestHeaderAndBody(manager: AFHTTPRequestOperationManager) -> [String : String] {
        manager.requestSerializer.setValue("Mozilla/5.0 (iPhone; CPU iPhone OS 12_1_2 like Mac OS X) AppleWebKit/605.1.15 (KHTML, like Gecko) Mobile/16C104 SP-engine/2.24.0 matrixstyle/0 info baiduboxapp/5.1.1.10 (Baidu; P2 12.1.2)", forHTTPHeaderField: "User-Agent")
        manager.requestSerializer.setValue("BAIDUCUID=gaS98giPH8_fu28xli2yu0PjHt_RaS8V_O2Ca0aMH8_ui2tY0O2NtYi2QP0z8WPCbWHmA; MBD_AT=1611037261; __yjs_duid=1_16ef112911fea7f8f85861dd4cd865d61611037267886; BDUSS=o4dG9PbFUyaHJ6YmlJUXFUV1htNlNnQVBvWVV1TkJZcXlocWYwRlEwWVd6VmhmSVFBQUFBJCQAAAAAAAAAAAEAAAAKxaCGusPA1tTDztIAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABZAMV8WQDFfU0; BAIDUID=5C8D78D64E6848E8E66D846DD5DFFE60:FG=1; fnizebra_b=P0lhrcN53vdMUS%2F6i6Jqke1DYnu1Bk7BKyn22Lr1OiSJcdkcuIE5QRexh80u3Q0CHAwYzANIhkgioe4D%2FK5Sa7%2BwWEa0CsRrSUcPM4pO%2FvjxvQAdf9qVcn5mRMjr6xQqsgdHPQGIyAFdR6CUMsb5axYXkySjX0%2BtBF7OsuEKruY%3D; SP_FW_VER=3.240.16; iadlist=49153; fontsize=1.10; H_WISE_SIDS=107314_110086_114551_127969_144966_154214_156286_156306_161278_162187_162203_162898_163115_163274_163390_163581_163808_163933_164043_164110_164164_164214_164216_164296_164692_164865_164880_164941_164992_165071_165135_165144_165327_165345_165591_165737_166055_166147_166180_166184_166255_166597_166599_166825_166987_167303_167388_167537_167571_167744_167771_167781_167926_167980_168034_168073_168215_168402; WISE_HIS_PM=1; BCLID=9140690592728723096; BDSFRCVID=JYKOJeCinR3Chr6eBYNMUON2YgKX8jRTH60oY2ODlwB_I7JoXeN5EG0P8x8g0KubrAb4ogKK0eOTHkCF_2uxOjjg8UtVJeC6EG0Ptf8g0f5; H_BDCLCKID_SF=tbCD_KK5JKD3HtJxKITHKb8jbeT22-usWH5i2hcH0bT_VCOJMbK-bfD4X4cPWMCHyCvihIn_Lfb1MCJvWj5cQ-AWLRnAtMTyyITw_l5TtUtWJKnTDMRh-RDF-GOyKMnitIT9-pno0hQrh459XP68bTkA5bjZKxtq3mkjbPbDfn02eCKu-n5jHjoWjajP; ST=0; BAIDULOC=13538033.981942_3634594.7065378_1000_289_1611659203826; ab_sr=1.0.0_MDg2OTViODUwYzI5ZDIwYmRjMmYyNjRhMmQyMWU0Y2JlMTRlOThhNDc5MzUyN2NjYjkzYzE4ZmYzYzQ1YjE3NmIwN2FiNTcxMDZjNjMwZTNiYTExMzhiNzQwMmY5ZmY3; x-logic-no=2", forHTTPHeaderField: "Cookie")
        manager.requestSerializer.setValue("https://m.baidu.com/s?tn=zbios&pu=sz%401320_480%2Ccuid%4045D34CA04432AE7FB8F806F7483DB2F06B58F8588FMMDBHJSRH%2Ccua%40828_1792_iphone_1.0.0.10_0%2Ccut%40iPhone11%2C8_12.1.2%2Cosname%40baiduboxapp%2Cosbranch%40i7%2Cctv%401%2Ccfrom%401005640h%2Ccsrc%40bdbox_tserch_txt%2Ccud%40REZCMkE2QjgtNkMzNy00MUEyLTgzRTEtQzMwNzk3RjhFQTRF&bd_page_type=1&word=%E5%BE%AE%E4%BF%A1%E5%B0%86%E6%8E%A8%E5%87%BA%E8%87%AA%E6%9C%89%E8%BE%93%E5%85%A5%E6%B3%95&sa=tkhr_3&ss=001001&network=1_0&from=1005640h&ant_ct=9%2BITzc9iee5%2F3Th%2BMIiUBqEXMBYcqM9RpZIkZRns%2Bxa8lKlxRUWJgmddGTCRGtet&rsv_sug4=8959&rsv_pq=16111291210279897629&oq=%E6%8B%9C%E7%99%BB%E5%90%AF%E7%A8%8B%E5%B0%B1%E8%81%8C%E5%91%8A%E5%88%AB%E6%B3%AA%E6%B4%92%E5%AE%B6%E4%B9%A1", forHTTPHeaderField: "Referer")
                
        var paras: [String : String] = [String : String]()
        paras["AFNetworking"] = "2.x"
        
        return paras
    }
    
    func stringWithDictionary(_ jsonDict : [String : AnyObject]) -> String {
        let data: Data = try! JSONSerialization.data(withJSONObject: jsonDict, options: JSONSerialization.WritingOptions.prettyPrinted)
        let jsonStr = String(data:data, encoding:String.Encoding.utf8)!
        
        print("jsonStr = \(jsonStr)")
        return jsonStr
    }
    
    func dictionaryWithString(_ jsonStr : String) -> [String : AnyObject] {
        let data: Data = jsonStr.data(using: String.Encoding.utf8)!
        
        let jsonDict: [String : AnyObject] = try! JSONSerialization.jsonObject(with: data, options: JSONSerialization.ReadingOptions.mutableContainers) as! [String : AnyObject]
        return jsonDict
    }
}
