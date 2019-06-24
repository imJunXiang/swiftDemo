//
//  MainViewController.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class MainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.创建首页
        tabBar.tintColor = .orange
        addChild("HomeTableViewController", "首页", imageName: "tabbar_home")
        addChild("MessageTableViewController", "消息", imageName: "tabbar_message_center")
        addChild("DiscoverTableViewController", "发现", imageName: "tabbar_discover")
        addChild("ProfileTableViewController", "我", imageName: "tabbar_profile")
    }
    
    /**
     初始化自控制
     */
    private func addChild(_ childControlleraName: String,_ title:String, imageName:String) {
        
        // -1 动态获取命名空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        
        // 0 讲字符串转换c为类
        let cls : AnyClass? = NSClassFromString(ns + "." + childControlleraName)
        // 0.1 创建对象 将 AnyClass 转换制定类型
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        
        // 1 设置首页tabbar 对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage = UIImage(named: imageName + "_highlighted")
        vc.title = title

        // 2.给首页包装导航控制器
        let nav = UINavigationController()
        nav.addChild(vc)
        // 3.add
        addChild(nav)
    }

}
