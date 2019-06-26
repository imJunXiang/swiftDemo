//
//  AppDelegate.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        // 设置导航条和工具条外观 设置完全局有效
        UINavigationBar.appearance().tintColor = .orange
        UITabBar.appearance().tintColor = .orange
        // create window
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.backgroundColor = .white
        // create rootController
        window?.rootViewController = MainViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

