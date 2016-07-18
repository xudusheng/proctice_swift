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
        button.setTitle("我点，我点", forState:.Normal);
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

        self.readLocalJsonFile();
    }
    //MARK: - 其他私有方法
    //TODO:读取本地json字符串文件(微信读书笔记文件)
    func readLocalJsonFile() -> Void {
        let filePath:String! = NSBundle.mainBundle().pathForResource("途客圈创业记：不疯魔，不成活-陈天", ofType: "");
        NSLog(filePath);
        let txtFilePath:String! = NSBundle.mainBundle().pathForResource("mynotes", ofType: "txt");
        print(txtFilePath);
        var contentString = "";
        let newline = "\n";
        
        do{
            let jsonString = try NSString(contentsOfFile: filePath, encoding: NSUTF8StringEncoding);
            let result = try NSJSONSerialization.JSONObjectWithData(jsonString.dataUsingEncoding(NSUTF8StringEncoding)!, options: .MutableLeaves) as! NSDictionary;
            let notes = result["updated"] as! NSArray;
            //排序
            let sortNotes = notes.sort({ (s1, s2) -> Bool in
                let chapterUid_s1 = s1["chapterUid"] as! NSNumber;
                let chapterUid_s2 = s2["chapterUid"] as! NSNumber;
                if (chapterUid_s1.integerValue < chapterUid_s2.integerValue){
                    return true;
                }
                return false;
            })
            
            //标题去重
            var index = -1;
            for aWechatNote in sortNotes{
                let chapterUid = aWechatNote["chapterUid"] as! NSNumber;
                let chapterTitle = aWechatNote["chapterTitle"] as! String;
                let markText = aWechatNote["markText"] as! String;
                if index != chapterUid.integerValue {
                    contentString += (newline + newline);
                    contentString += "第\(chapterUid)章  \(chapterTitle)"
                    contentString += newline;
                    index = chapterUid.integerValue;
                }
                contentString += markText;
                contentString += newline;
            }
            print(contentString);
            try contentString.writeToFile(txtFilePath, atomically: true, encoding: NSUTF8StringEncoding);
        }catch let error as NSError{
            
        }
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
