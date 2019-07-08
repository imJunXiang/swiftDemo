//
//  JXBaseViewController.swift
//  JXCortrollerTranstion
//
//  Created by 俊祥 on 2019/7/7.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class JXBaseViewController: UIViewController,UITabBarControllerDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.randomColor
        tabBarController?.delegate = self
    }
    
    // MARK: -UITabBarControllerDelegate
    func tabBarController(_ tabBarController: UITabBarController, animationControllerForTransitionFrom fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return JXTabbarTransformer()
    }
}
