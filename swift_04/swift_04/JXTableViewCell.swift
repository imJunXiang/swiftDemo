//
//  JXTableViewCell.swift
//  swift_04
//
//  Created by 俊祥 on 2019/7/6.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class JXTableViewCell: UITableViewCell {
    
    public let jx_imageView:UIImageView?
    public let jx_titleLabel:UILabel?
    public let jx_dateLabel:UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        
        jx_imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 40, height: 40))
        jx_titleLabel = UILabel(frame: CGRect(x: 50, y: 0, width: 200, height: 40))
        jx_dateLabel = UILabel(frame: CGRect(x: 250, y: 0, width: 200, height: 40))
        
        jx_titleLabel?.textColor = .black
        jx_dateLabel?.textColor = .black
        
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        addSubview(jx_imageView!)
        addSubview(jx_titleLabel!)
        addSubview(jx_dateLabel!)
      
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
