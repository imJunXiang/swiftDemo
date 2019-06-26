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
//        tabBar.tintColor = .orange
        // 添加子控制器
        addChildViewControllers()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 添加加好按钮
        setupComposeBtn()
    }
    
    // MARK: - 内部控制方法
    private func setupComposeBtn() {
        // 1.添加加号按钮
        tabBar.addSubview(composeBtn)
        // 2.调整加号按钮的位置
        let width = UIScreen.main.bounds.size.width / CGFloat(viewControllers!.count)
        let rect = CGRect(x: 0, y: 0, width: width, height: 44)
        composeBtn.frame = rect
        composeBtn.center = CGPoint(x: tabBar.frame.size.width * 0.5, y: tabBar.frame.size.height * 0.5)
    }
    
    /** 添加所有子控制器 */
    private func addChildViewControllers() {
        // 1.获取json文件的路径
        let path = Bundle.main.path(forResource: "MainVCSettings.json", ofType: nil)
        // 2.通过文件路径创建NSData
        if let jsonPath = path {
            let jsonData = NSData(contentsOfFile: jsonPath)
            
            do {
                // 有可能发生异常的代码放到这里
                // 3.序列化json数据 --> Array
                // try : 发生异常会跳到catch中继续执行
                // try!: 发生异常程序直接崩溃
                let dictArr = try JSONSerialization.jsonObject(with: jsonData! as Data, options: JSONSerialization.ReadingOptions.mutableContainers)
                
                // 4.遍历数组 必须明确数组类型
                for dict in dictArr as! [[String:String]] {
                    // 报错的原因是因为参数必须有值，但是字典的返回值是可选类型
                    addChild(dict["vcName"]!, dict["title"]!, imageName: dict["imageName"]!)
                }
            } catch {
                // 发生异常之后 从本地加载子控制器
                addChild("HomeTableViewController", "首页", imageName: "tabbar_home")
                addChild("MessageTableViewController", "消息", imageName: "tabbar_message_center")
                addChild("NullViewController", "", imageName: "")
                addChild("DiscoverTableViewController", "发现", imageName: "tabbar_discover")
                addChild("ProfileTableViewController", "我", imageName: "tabbar_profile")
            }
        }
    }
    
    /** 初始化自控制 */
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
    
    // MARK: - 懒加载
    private lazy var composeBtn: UIButton = {
        let btn = UIButton()
        // 设置前景图片
        btn.setImage(UIImage(named: "tabbar_compose_icon_add"), for: UIControl.State.normal)
        btn.setImage(UIImage(named: "tabbar_compose_icon_add_highlighted"), for: UIControl.State.selected)
        // 设置背景图片
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button"), for: UIControl.State.normal)
        btn.setBackgroundImage(UIImage(named: "tabbar_compose_button_highlighted"), for: UIControl.State.selected)
        
        // 添加监听
        btn.addTarget(self, action: #selector(composeBtnClick), for: .touchUpInside)
        return btn
    }()
    
    @objc func composeBtnClick() {
        print(#function)
    }
}
