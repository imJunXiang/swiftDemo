//
//  Product.swift
//  swift_01
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import Foundation

class Product {
    var name : String?
    var cellImageName : String?
    var fullscreenImageName : String?
    
    init(name: String,cellImageName: String, fullScreenImageName: String) {
        self.name = name
        self.cellImageName = cellImageName
        self.fullscreenImageName = fullScreenImageName
    }
}
