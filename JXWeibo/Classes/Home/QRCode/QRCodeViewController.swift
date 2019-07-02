//
//  QRCodeViewController.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/28.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController,UITabBarDelegate {
    // 扫描容器的高度
    @IBOutlet weak var containerHeightCons: NSLayoutConstraint!
    // 冲击波
    @IBOutlet weak var scanlineCons: NSLayoutConstraint!
    // 冲击波顶部约束
    @IBOutlet weak var scanLineView: UIImageView!
    // 休息 storyBoard 是真不好用
    @IBAction func closeBtnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // 底部视图
    @IBOutlet weak var customTabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置底部视图默认选择第0个
        customTabbar.selectedItem = customTabbar.items![0]
        customTabbar.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        // 让约束重顶部开始
        self.scanlineCons.constant = -self.containerHeightCons.constant
        self.scanLineView.layoutIfNeeded()
        UIView.setAnimationRepeatCount(MAXFLOAT)
        // 执行冲击波动画
        UIView.animate(withDuration: 5.0) {
            // 1.修改约束
            self.scanlineCons.constant = self.containerHeightCons.constant
            
            // 2.强制更新
            self.scanLineView.layoutIfNeeded()
        }
    }
    
    //MARK: - UITabBarDelegate
    func tabBar(_ tabBar: UITabBar, didSelect item: UITabBarItem) {
        if item.tag == 1 {
            print("二维码")
            self.containerHeightCons.constant = 300
        } else {
            print("条形码")
            self.containerHeightCons.constant = 150
        }
        
        self.scanLineView.layer.removeAllAnimations()
    }
}
