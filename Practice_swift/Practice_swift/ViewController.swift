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
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        NSLog(indexPath.description);
    }

}

