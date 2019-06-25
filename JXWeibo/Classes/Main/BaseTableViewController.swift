//
//  BaseTableViewController.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/25.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController {
    // 定义一个变量 保存当前用户是否登录
    var userLogin = false
    
    override func loadView() {
        userLogin ? super.loadView() : setupVisitorView()
    }

    /** 创建未登录界面 */
    private func setupVisitorView() {
        let customView = VisitorView()
        view = customView
    }
}
