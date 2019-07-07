//
//  UIColor+Extension.swift
//  JXCortrollerTranstion
//
//  Created by 俊祥 on 2019/7/7.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

extension UIColor {
    /**  扩展UIColor 生成随机颜色 */
    class var randomColor: UIColor {
        get {
            let red = CGFloat(arc4random()%256)/255.0
            let green = CGFloat(arc4random()%256)/255.0
            let blue = CGFloat(arc4random()%256)/255.0
            return UIColor(red: red, green: green, blue: blue, alpha: 1.0)
        }
    }
    
    /**
     * UIColor的扩展类 将16进制颜色转换为RGB
     * @param hexString 16进制颜色字符串
     */
    convenience init(hexString: String) {
        let scanner:Scanner = Scanner(string:hexString)
        var valueRGB:UInt32 = 0
        if scanner.scanHexInt32(&valueRGB) == false {
            self.init(red: 0,green: 0,blue: 0,alpha: 0)
        }else{
            self.init(
                red:CGFloat((valueRGB & 0xFF0000)>>16)/255.0,
                green:CGFloat((valueRGB & 0x00FF00)>>8)/255.0,
                blue:CGFloat(valueRGB & 0x0000FF)/255.0,
                alpha:CGFloat(1.0)
            )
        }
    }
}
