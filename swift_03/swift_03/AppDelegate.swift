//
//  AppDelegate.swift
//  swift_03
//
//  Created by 俊祥 on 2019/7/5.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?


    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = UINavigationController(rootViewController: JXMeViewController())
        return true
    }
}

