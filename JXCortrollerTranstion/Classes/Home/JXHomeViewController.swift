//
//  JXHomeViewController.swift
//  JXCortrollerTranstion
//
//  Created by 俊祥 on 2019/7/7.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class JXHomeViewController: JXBaseViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
       navigationController?.delegate = self
        view.addSubview(goBtn)
    }
    
    private lazy var goBtn:UIButton = {
        var btn = UIButton(frame: CGRect(x: 0, y: 0, width: 50, height: 50))
        btn.center = view.center
        btn.backgroundColor = UIColor.randomColor
        btn .addTarget(self, action: #selector(clickBtn), for: .touchUpInside)
        return btn
    }()
    
    @objc func clickBtn() {
//        navigationController?.pushViewController(JXHomeDetailViewController(), animated: true)
        let vc = JXHomeDetailViewController()
        vc.transitioningDelegate = self
        present(vc, animated: true, completion: nil)
    }
}

extension JXHomeViewController:UINavigationControllerDelegate {
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationController.Operation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return JXTabbarTransformer()
    }
}

extension JXHomeViewController:UIViewControllerTransitioningDelegate {
    func animationController(forPresented presented: UIViewController, presenting: UIViewController, source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return JXTabbarTransformer()
    }
}
