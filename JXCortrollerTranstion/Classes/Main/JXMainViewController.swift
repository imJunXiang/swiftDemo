//
//  JXMainViewController.swift
//  JXCortrollerTranstion
//
//  Created by 俊祥 on 2019/7/7.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class JXMainViewController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 添加子控制器
        addChildViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
    /** 添加所有子控制器 */
    private func addChildViewControllers() {
        // 不通过json 文件 直接加
        addChild("JXHomeViewController", "首页", imageName: "tabbar_home")
        addChild("JXNearShopViewController", "附近店铺", imageName: "tabbar_message_center")
        addChild("JXCategoryViewController", "分类", imageName: "tabbar_home")
        addChild("JXShopCartViewController", "购物车", imageName: "tabbar_discover")
        addChild("JXProfileViewController", "我", imageName: "tabbar_profile")
    }
    
    private func addChild(_ childControllerName:String,_ title:String,imageName:String) {
        // 1 动态获取命名空间
        let ns = Bundle.main.infoDictionary!["CFBundleExecutable"] as! String
        
        // 2.0 将字符串转换为类
        let cls : AnyClass? = NSClassFromString(ns + "." + childControllerName)
        // 2.1 创建对象 将 AnyClass 转换定制类型
        let vcCls = cls as! UIViewController.Type
        let vc = vcCls.init()
        
        // 3 设置首页tabbar 对应的数据
        vc.tabBarItem.image = UIImage(named: imageName)
        vc.tabBarItem.selectedImage =  UIImage(named: imageName + "_highlighted")
        vc.title = title
        
        // 4.给首页包装导航控制器
        let nav = UINavigationController()
        nav.addChild(vc)
        addChild(nav)
    }
}
