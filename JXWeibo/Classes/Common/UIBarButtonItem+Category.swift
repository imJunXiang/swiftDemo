//
//  UIBarButtonItem+Category.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/26.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

extension UIBarButtonItem {
    // 如果在func前面加class 就相当于OC前的加号
    class func creatBarButtonItem(imageName: String, target: Any?, action: Selector) -> UIBarButtonItem {
        let btn = UIButton()
        btn.setImage(UIImage(named: imageName), for: .normal)
        btn.setImage(UIImage(named: imageName + "_highlighted"), for: .highlighted)
        btn.sizeToFit()
        btn.addTarget(target, action: action, for: .touchUpInside)
        return UIBarButtonItem(customView: btn)
    }
}
