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
    
    // 记录当前书否是展开
    var isPresent: Bool = false
}

extension HomeTableViewController : UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    
    //  实现代理方法，告诉系统谁来负责转场动画
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        return PopoverPresentationController(presentedViewController: presented, presenting: presenting)
    }
    
    // 告诉系统谁来负责展现动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        return self
    }
    
    // 告诉系统谁来负责消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        return self
    }
    
    // MARK: - UIViewControllerAnimatedTransitioning
    // MARK: - 只要实现这两个方法就没有默认动画了
    // 返回动画时长  transitionContexts 上下文 返回了所有参数
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.5
    }
    
    // 告诉系统如何动画
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        
        if isPresent {
            // 1.拿到展现的视图
            let toView = transitionContext.view(forKey: .to)
            toView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.0)
            
            // 注意 一定要将视图添加到容器上
            transitionContext.containerView.addSubview(toView!)
            
            // 设置锚点
            toView?.layer.anchorPoint = CGPoint(x: 0.5, y: 0)
            
            // 2.执行动画
            UIView.animate(withDuration: 0.5, animations: {
                // 情况transform
                toView?.transform = CGAffineTransform(translationX: 1, y: 1)
            }) { (_) in
                // 动画执行完毕 一定告知系统 不然可能出w未知错误
                transitionContext.completeTransition(true)
            }
        } else {
            // 关闭
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: 0.2, animations: {
                // 注意：由于CGFloat是不准确的 所以写0.0会没有动画
                // 压扁
                fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }
        
    }
}
