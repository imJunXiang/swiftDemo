//
//  ToDoItem.swift
//  swift_04
//
//  Created by 俊祥 on 2019/7/6.
//  Copyright © 2019 俊祥. All rights reserved.
//

import Foundation

class ToDoItem: NSObject  {
    var id:String
    var image:String
    var title:String
    var date: Date
    
    init(id:String,image:String,title:String,date:Date) {
        self.id = id
        self.image = image
        self.title = title
        self.date = date
    }
}
