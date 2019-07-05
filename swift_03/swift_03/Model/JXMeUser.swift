//
//  JXMeUser.swift
//  swift_03
//
//  Created by 俊祥 on 2019/7/5.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class JXMeUser {
    var name : String
    var avatarName : String
    var education : String
    
    init(name:String,avatarName:String = "bayMax",education:String) {
        self.name = name
        self.avatarName = avatarName
        self.education = education
    }
}
