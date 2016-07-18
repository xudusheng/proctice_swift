//
//  XDSAPITestViewController.swift
//  Practice_swift
//
//  Created by zhengda on 16/7/4.
//  Copyright © 2016年 上海优蜜科技有限公司. All rights reserved.
//

import UIKit
class XDSAPITestViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.apiTestViewControllerDataInit();
        self.createAPITestViewControllerUI();
    }

    //MARK:UI相关
    func createAPITestViewControllerUI() -> Void{
        self.view.backgroundColor = UIColor.whiteColor();
        let screenHeight = UIScreen.mainScreen().bounds.size.height;
        let button = UIButton(type: .Custom);
        button.backgroundColor = UIColor.brownColor();
        self.view.addSubview(button);
        button.snp_makeConstraints { (make) in
            make.centerX.equalTo(self.view);
            make.centerY.equalTo(screenHeight * 0.4);
        };
        button.addTarget(self, action: #selector(self.buttonClick(_:)), forControlEvents: .TouchUpInside);
        
    }
    
    //MARK: - 代理方法
    
    //MARK: - 网络请求
    
    //MARK: - 事件响应处理
    func buttonClick(button:UIButton) -> Void {
        NSLog("xxxxxxxxxx");

        
    }
    //MARK: - 其他私有方法
    //TODO:读取本地json字符串文件(微信读书笔记文件)
    func readLocalJsonFile() -> Void {
        let filePath = NSBundle.mainBundle().pathForResource("途客圈创业记：不疯魔，不成活-陈天", ofType: "");
        NSLog(filePath!);
    }
    //TODO:自己写的后台接口
    func selfRequestAPI() -> Void {
        let manager = AFHTTPSessionManager();
        manager.responseSerializer = AFCompoundResponseSerializer();
        
        manager.POST("http://localhost:8080/Iyaose/HttpServletResponseDemo", parameters: nil, progress: { (progress:NSProgress) in
            
            }, success: { (dataTask:NSURLSessionDataTask, obj:AnyObject?) in
                do{
                    let resultDic = try NSJSONSerialization.JSONObjectWithData(obj as! NSData, options: .MutableContainers);
                    NSLog("\(resultDic)");
                }catch let error as NSError{
                    NSLog("-----\(error.description)");
                }
                NSLog("dataTask==========\(dataTask)");
                NSLog("obj ====== \(obj?.classForCoder)");
                
        }) { (dataTask:NSURLSessionDataTask?, error:NSError) in
            NSLog("error ====== \(error)");
        };
    }
    //MARK: - 内存管理相关
    func apiTestViewControllerDataInit() -> Void{
    }

}
