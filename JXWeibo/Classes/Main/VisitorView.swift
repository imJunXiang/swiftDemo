//
//  VisitorView.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/25.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class VisitorView: UIView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 1.添加子控件
        addSubview(iconView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
        // 2.布局子控件
        iconView.snp.makeConstraints { (mask) in
            mask.center.equalToSuperview()
            mask.width.height.equalTo(200)
        }
        
        homeIcon.snp.makeConstraints { (mask) in
            mask.center.equalToSuperview()
            mask.width.height.equalTo(100)
        }
        
        messageLabel.snp.makeConstraints { (mask) in
            mask.centerX.equalTo(iconView)
            mask.bottom.equalTo(iconView)
            mask.width.equalTo(200)
        }
        
        loginButton.snp.makeConstraints { (mask) in
            mask.top.equalTo(messageLabel).offset(30)
            mask.left.equalTo(iconView)
            mask.width.equalTo(60)
            mask.height.equalTo(30)
        }
        
        registerButton.snp.makeConstraints { (mask) in
            mask.top.equalTo(messageLabel).offset(30)
            mask.right.equalTo(iconView)
            mask.width.equalTo(60)
            mask.height.equalTo(30)
        }
    }
    
    // swift 推荐我们自定义一个控件 ，要么用存代码，要么用xib/storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 懒加载控件
    /// 转盘
    private lazy var iconView: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_smallicon"))
        return iv
    }()
    
    /// 图标
    private lazy var homeIcon: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "visitordiscover_feed_image_house"))
        return iv
    }()
    
    /// 文本
    private lazy var messageLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 0
        label.text = "世界观课哈法国卡开始感觉发货撒即可法国大使框架和发挥科技咖妃大法官价格恢复教案设计合法"
        return label
    }()
    
    /// 登录按钮
    private lazy var loginButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("登录", for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        return btn
    }()
    
    /// 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        return btn
    }()
}
