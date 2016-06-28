//
//  XDSTracker.swift
//  Practice_swift
//
//  Created by xudosom on 16/6/27.
//  Copyright © 2016年 上海优蜜科技有限公司. All rights reserved.
//

import UIKit
//跟踪器
class XDSTracker: NSObject {
    
    override class func initialize(){
        NSLog("xxxxxxxxxxx");
        //        注意block的类型，UIView的方法中已经直接声明好参数和返回值。Aspects为了灵活则直接声明为了一个id对象。id对应为swift中的AnyObject对象。所以在swift中为了正常使用这个方法，需要将闭包转换为AnyObject。代码如下：
        //        let wrappedBlock:@convention(block) (aspectInfo:AspectInfo, restaurant:AnyObject)->Void={(aspectInfo:AspectInfo, restaurant:AnyObject) in
        //            NSLog("ooooooooooo")
        //        }
        //        let wrappedObject: AnyObject = unsafeBitCast(wrappedBlock, AnyObject.self)
        //        do{
        //            try ViewController.aspect_hookSelector(#selector(ViewController.loginButtonClick(_:)), withOptions: AspectOptions.PositionAfter, usingBlock:wrappedObject);
        //        }catch let err as NSError{
        //            NSLog("error = " + err.description)
        //        }
        
        //这里将block的转换方法提取出来
        do{
            try ViewController.aspect_hookSelector(#selector(ViewController.tableView(_:didSelectRowAtIndexPath:)), withOptions: AspectOptions.PositionAfter, usingBlock: XDSTracker.wrappedObject({
                (aspectInfo:AspectInfo, restaurant:AnyObject) in
                NSLog("ooooooooooo")
            }))
        }catch let err as NSError{
            NSLog("error = " + err.description)
        }
    }
    
    
    //MARK:
    class func wrappedObject(block: (aspectInfo:AspectInfo, restaurant:AnyObject)->Void) -> AnyObject {
        let wrappedBlock:@convention(block)(aspectInfo:AspectInfo, restaurant:AnyObject)->Void  = block
        let wrappedObject: AnyObject = unsafeBitCast(wrappedBlock, AnyObject.self)
        return wrappedObject
    }
    
    
    
}
