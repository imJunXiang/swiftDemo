//
//  ProductViewController.swift
//  swift_01
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class ProductViewController: UIViewController {
    
    var productImageView : UIImageView?
    var productNameLable : UILabel?
    
    var product: Product?
    override func viewDidLoad() {
        super.viewDidLoad()
        productNameLable = UILabel(frame: CGRect(x: 20, y: 104, width: 335, height: 38));
        productImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 375, height: 667));
        
        
        productNameLable?.backgroundColor = UIColor.yellow
        productNameLable?.text = "hello world"
        productNameLable?.textAlignment = NSTextAlignment.center
        
        self.view.backgroundColor = .white
        
        self.view.addSubview(productNameLable!)
        self.view.addSubview(productImageView!)
    }
    
    func addToCartButtomDidTap(_ sender: AnyObject) {
        print("Add to cart successfully")
    }
}
