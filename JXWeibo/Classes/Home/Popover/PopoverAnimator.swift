//
//  PopoverAnimator.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/27.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

let JXPopoverAnimatorsWillShow = "JXPopoverAnimatorsWillShow"
let JXPopoverAnimatorsWillDismiss = "JXPopoverAnimatorsWillDismiss"

class PopoverAnimator: NSObject ,UIViewControllerTransitioningDelegate,UIViewControllerAnimatedTransitioning {
    // 记录当前书否是展开
    var isPresent: Bool = false
    var presentFrame = CGRect.zero
    
    //  实现代理方法，告诉系统谁来负责转场动画
    func presentationController(forPresented presented: UIViewController, presenting: UIViewController?, source: UIViewController) -> UIPresentationController? {
        let pc = PopoverPresentationController(presentedViewController: presented, presenting: presenting)
        pc.presentFrame = presentFrame
        return pc
    }
    
    // 告诉系统谁来负责展现动画
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = true
        // 发送通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JXPopoverAnimatorsWillShow), object: self)
        return self
    }
    
    // 告诉系统谁来负责消失动画
    func animationController(forDismissed dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        isPresent = false
        // 发送通知
        NotificationCenter.default.post(name: NSNotification.Name(rawValue: JXPopoverAnimatorsWillDismiss), object: self)
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
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                // 情况transform
                toView?.transform = CGAffineTransform(translationX: 1, y: 1)
            }) { (_) in
                // 动画执行完毕 一定告知系统 不然可能出w未知错误
                transitionContext.completeTransition(true)
            }
        } else {
            // 关闭
            let fromView = transitionContext.view(forKey: .from)
            UIView.animate(withDuration: transitionDuration(using: transitionContext), animations: {
                // 注意：由于CGFloat是不准确的 所以写0.0会没有动画
                // 压扁
                fromView?.transform = CGAffineTransform(scaleX: 1.0, y: 0.000001)
            }) { (_) in
                transitionContext.completeTransition(true)
            }
        }
        
    }
}
