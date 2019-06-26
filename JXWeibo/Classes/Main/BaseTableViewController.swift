//
//  BaseTableViewController.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/25.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class BaseTableViewController: UITableViewController, VisitorViewDelegate {
    // 定义一个变量 保存当前用户是否登录
    var userLogin = true
    // 定义属性 保存未登录界面
    var visitorView: VisitorView?
    override func loadView() {
        userLogin ? super.loadView() : setupVisitorView()
    }

    /** 创建未登录界面 */
    private func setupVisitorView() {
        // 1.初始化未登录界面
        let customView = VisitorView()
        customView.delegate = self
        view = customView
        visitorView = customView
        
        // 2.设置导航条未登录按钮
//        navigationController?.navigationBar.tintColor = .orange
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "注册", style: .plain, target: self, action: #selector(registerBtnWillClick))
        
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "登录", style: .plain, target: self, action: #selector(loginBtnWillClick))
    }
    
    // MARK: - VisitorViewDelegate
    @objc func loginBtnWillClick() {
        print(#function)
    }
    
    @objc func registerBtnWillClick() {
        print(#function)
    }
}
