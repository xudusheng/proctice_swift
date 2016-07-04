//
//  ViewController.swift
//  Practice_swift
//
//  Created by xudosom on 16/6/25.
//  Copyright © 2016年 上海优蜜科技有限公司. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {
        
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
    }

    func loginButtonClick(button:UIButton) -> Void {
        
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        if (indexPath.row == 0 && indexPath.section == 0) {
            let apiTestVC = XDSAPITestViewController();
            self.navigationController?.pushViewController(apiTestVC, animated: true);
            
        }
    }

    
    ////MARK: - UI相关
    //func createOCMainTabBarControllerUI(){
    //}
    //
    ////MARK: - 代理方法
    //
    ////MARK: - 网络请求
    //
    ////MARK: - 事件响应处理
    //
    ////MARK: - 其他私有方法
    //
    ////MARK: - 内存管理相关
    //func ocMainTabBarControllerDataInit(){
    //}
    
}

