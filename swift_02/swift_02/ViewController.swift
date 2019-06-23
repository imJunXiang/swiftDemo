//
//  ViewController.swift
//  swift_02
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {

    fileprivate let mainStopwatch: Stopwatch = Stopwatch()
    fileprivate let lapStopwatch: Stopwatch = Stopwatch()
    fileprivate var isPlay : Bool = false
    fileprivate var laps: [String] = []
    
    weak var timerLabel: UILabel?
    weak var lapTimerLable: UILabel?
    weak var playPauseButton: UIButton?
    weak var lapRestButton: UIButton?
    weak var lapsTableView: UITableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let initCircleButton: (UIButton) -> Void = { button in
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.backgroundColor = UIColor.white
        }
        
        initCircleButton(playPauseButton!)
        initCircleButton(lapRestButton!)
        
        lapRestButton?.isEnabled = false
        
        lapsTableView?.delegate = self
        lapsTableView?.dataSource = self
    }

    override var shouldAutorotate: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
}

