//
//  UIColor+Extension.swift
//  swift_03
//
//  Created by 俊祥 on 2019/7/5.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

public extension UIColor {
    convenience init(r:Int,g:Int,b:Int,a:CGFloat) {
        self.init(red:CGFloat(r)/255,green:CGFloat(g)/255,blue:CGFloat(b)/255,alpha:a)
    }
    
    convenience init(hex:Int) {
        self.init(r:(hex & 0xff0000) >> 16,g:(hex & 0xff00) >> 8,b:(hex & 0xff),a:1)
    }
}
