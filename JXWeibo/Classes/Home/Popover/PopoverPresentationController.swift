//
//  PopoverPresentationController.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/26.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class PopoverPresentationController: UIPresentationController {
    /** 初始化方法，用于创建负责转场动画的对象 */
    override init(presentedViewController: UIViewController, presenting presentingViewController: UIViewController?) {
        super.init(presentedViewController: presentedViewController, presenting: presentingViewController)
        print(presentedViewController)
    }
    
    /** 即将布局转场的子视图是调用 */
    override func containerViewWillLayoutSubviews() {
        // 1.修改弹出视图的大小
        // containerView 容器视图
        // presentedView 被展示视图
        presentedView?.frame =  CGRect(x: 100, y: 56, width: 200, height: 200)
        
        // 2.在容器视图添加蒙版，插入到展现视图的下面
        containerView?.insertSubview(coverView, at: 0)
    }
    
    // MARK: - 懒加载
    private lazy var coverView: UIView = {
        // 1.创建view
        let view = UIView()
        view.backgroundColor = UIColor(white: 0.0, alpha: 0.2)
        view.frame = UIScreen.main.bounds
        
        // 添加监听
        let tap = UITapGestureRecognizer(target: self, action: #selector(close))
        view.addGestureRecognizer(tap)
        return view
    }()
    
    @objc func close() {
        presentingViewController.dismiss(animated: true, completion: nil)
    }
}
