//
//  JXTableViewCell.swift
//  swift_02
//
//  Created by 俊祥 on 2019/7/4.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class JXTableViewCell: UITableViewCell {
    
    var countLable:UILabel?
    var timeLable:UILabel?
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        findView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func findView()  {
        contentView.addSubview(countL)
        contentView.addSubview(timeL)
        countLable = countL
        timeLable = timeL
    }
    
    lazy var countL:UILabel = {
        let lable = UILabel(frame: CGRect(x: 10, y: 4, width: 100, height: 40))
        lable.text = ""
        lable.font = UIFont.systemFont(ofSize: 20)
        return lable
    }()
    
    lazy var timeL:UILabel = {
        let lable = UILabel(frame: CGRect(x: 150, y: 4, width: 100, height: 40))
        lable.font = UIFont.systemFont(ofSize: 20)
        lable.text = ""
        return lable
    }()
}
