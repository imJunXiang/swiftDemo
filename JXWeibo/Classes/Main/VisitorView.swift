//
//  VisitorView.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/25.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

// swift 中定义协议: 必须遵守NSObjectProtocol
protocol VisitorViewDelegate: NSObjectProtocol {
    // 登录回掉
    func loginBtnWillClick()
    // 注册回调
    func registerBtnWillClick()
}

class VisitorView: UIView {
    
    // 定义一个属性保存代理 一定要加weak
    weak var delegate : VisitorViewDelegate?
    
    
    /** 设置未登录界面是否是首页 */
    func setupVisitorInfo(isHome:Bool,imageName:String,message:String) {
        iconView.isHidden = !isHome
        // 修改中间的图标
        homeIcon.image = UIImage(named: imageName)
        messageLabel.text = message
        
        // 判断是否需要执行动画
        if isHome {
            startAnimation()
        }
    }
    
    @objc func loginBtnClick() {
        delegate?.loginBtnWillClick()
    }
    
    @objc func registerBtnClick() {
        delegate?.registerBtnWillClick()
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        // 1.添加子控件
        addSubview(iconView)
        addSubview(homeIcon)
        addSubview(messageLabel)
        addSubview(loginButton)
        addSubview(registerButton)
        
        // 2.布局子控件
        iconView.snp.makeConstraints {
            $0.centerX.equalToSuperview()
            $0.centerY.equalToSuperview().offset(-50)
            $0.width.height.equalTo(140)
        }
        
        homeIcon.snp.makeConstraints {
            $0.center.equalTo(iconView)
            $0.width.height.equalTo(70)
        }
        
        messageLabel.snp.makeConstraints {
            $0.centerX.equalTo(iconView)
            $0.width.equalTo(200)
            $0.top.equalTo(iconView.snp.bottom)
        }
        
        loginButton.snp.makeConstraints {
            $0.top.equalTo(messageLabel.snp.bottom).offset(10)
            $0.left.equalTo(messageLabel).offset(30)
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }
        
        registerButton.snp.makeConstraints {
            $0.top.equalTo(messageLabel.snp.bottom).offset(10)
            $0.right.equalTo(messageLabel).offset(-30)
            $0.width.equalTo(60)
            $0.height.equalTo(30)
        }
    }
    
    // swift 推荐我们自定义一个控件 ，要么用存代码，要么用xib/storyboard
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    // MARK: - 内部控制方法
    private func startAnimation() {
        // 1.创建动画
        let anim = CABasicAnimation(keyPath: "transform.rotation")
        // 2.设置动画属性
        anim.toValue = 2 * Double.pi
        anim.duration = 20
        anim.repeatCount = MAXFLOAT
        // 默认为 true 执行完就移除
        anim.isRemovedOnCompletion = false
        // 3.将动画加到图层
        iconView.layer.add(anim, forKey: nil)
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
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitleColor(.orange, for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        btn.addTarget(self, action: #selector(loginBtnClick), for: .touchUpInside)
        return btn
    }()
    
    /// 注册按钮
    private lazy var registerButton: UIButton = {
        let btn = UIButton()
        btn.setTitle("注册", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        btn.setTitleColor(.black, for: .normal)
        btn.setBackgroundImage(UIImage(named: "common_button_white_disable"), for: .normal)
        btn.addTarget(self, action: #selector(registerBtnClick), for: .touchUpInside)
        return btn
    }()
}
