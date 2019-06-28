//
//  QRCodeViewController.swift
//  JXWeibo
//
//  Created by 俊祥 on 2019/6/28.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class QRCodeViewController: UIViewController {
    @IBAction func closeBtnClick(_ sender: Any) {
        dismiss(animated: true, completion: nil)
    }
    // 底部视图
    @IBOutlet weak var customTabbar: UITabBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        // 1.设置底部视图默认选择第0个
        customTabbar.selectedItem = customTabbar.items![0]
    }

}
