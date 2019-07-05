//
//  JXMeBaseCell.swift
//  swift_03
//
//  Created by 俊祥 on 2019/7/5.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class JXMeBaseCell: UITableViewCell {
    
    static let identifier = "JXMeBaseCell"
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        backgroundColor = Specs.color.white
        textLabel?.textColor = Specs.color.black
        textLabel?.font = Specs.font.large
        
        detailTextLabel?.font = Specs.font.small
        detailTextLabel?.textColor = Specs.color.gray
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
