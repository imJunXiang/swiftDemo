//
//  HomeTableViewController.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class HomeTableViewController: BaseTableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.如果没有登录，就设置未登录界面的信息
        if !userLogin {
            visitorView?.setupVisitorInfo(isHome: true, imageName: "visitordiscover_feed_image_house", message: "关注一些人，回这里看看有什么惊喜")
            return
        }
        
        // 2.初始化导航条
        setupNav()
    }
    
    private func setupNav() {
        // 1.初始化左右按钮
        navigationItem.leftBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_friendattention",target: self, action: #selector(leftItemClick))
        navigationItem.rightBarButtonItem = UIBarButtonItem.creatBarButtonItem(imageName: "navigationbar_pop", target: self, action: #selector(rightItemClick))
        
        // 2.初始标题按钮
        let titleBtn = TitleButton()
        titleBtn.setTitle("极客江南 ", for: .normal)
        titleBtn.addTarget(self, action: #selector(titleBtnClick), for: .touchUpInside)
        navigationItem.titleView = titleBtn
    }
    
    @objc func titleBtnClick(btn:TitleButton) {
        // 1.修改箭头方向
        btn.isSelected = !btn.isSelected
        // 2.弹出菜单
        let sb = UIStoryboard(name: "PopoverViewController", bundle: nil)
        let vc = sb.instantiateInitialViewController()
        // 2.1 设置转场的代理
        // 默认情况下moda会移除以前控制器的view,如果自定义就不会
        vc?.transitioningDelegate = self
        // 2.2 设置转场的样式
        vc?.modalPresentationStyle = .custom
        
        present(vc!, animated: true, completion: nil)
        
    }
    
    @objc func leftItemClick() {
        print(#function)
    }
    
    @objc func rightItemClick() {
        print(#function)
    }
}

extension HomeTableViewController : UIViewControllerTransitioningDelegate {
    //  实现代理方法，告诉系统谁来负责转场动画
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PopoverPresentationController(presentedViewController: presented, presenting: presenting)
    }
}
