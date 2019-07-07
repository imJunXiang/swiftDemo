//
//  JXTransformer.swift
//  JXCortrollerTranstion
//
//  Created by 俊祥 on 2019/7/7.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit
class JXTransformer: NSObject,UIViewControllerAnimatedTransitioning {
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 0.3
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {
        let fromView = transitionContext.view(forKey: .from)
        let toView = transitionContext.view(forKey: .to)!
        
        let fromFrame = transitionContext.initialFrame(for: transitionContext.viewController(forKey: .from)!)
        
        fromView?.frame = fromFrame
        transitionContext.containerView.addSubview(toView)
        toView.frame = CGRect(x: 0, y: 0, width: UIScreen.main.bounds.size.width, height: 0)
        UIView.animate(withDuration: 0.3, animations: {
            toView.frame = fromFrame
        }) { (_) in
            transitionContext.completeTransition(true)
        }
    }
}
