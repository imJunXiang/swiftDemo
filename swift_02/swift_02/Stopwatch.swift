//
//  Stopwatch.swift
//  swift_02
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import Foundation
class Stopwatch: NSObject {
    var counter: Double
    var timer: Timer
    override init() {
        counter = 0.0
        timer = Timer()
    }
}
