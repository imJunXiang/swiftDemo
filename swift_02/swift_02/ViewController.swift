//
//  ViewController.swift
//  swift_02
//
//  Created by 俊祥 on 2019/6/23.
//  Copyright © 2019 俊祥. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate {

    fileprivate let mainStopwatch: Stopwatch = Stopwatch()
    fileprivate let lapStopwatch: Stopwatch = Stopwatch()
    fileprivate var isPlay : Bool = false
    fileprivate var laps: [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.addSubview(timerLabel)
        view.addSubview(lapTimerLable)
        view.addSubview(lapRestButton)
        view.addSubview(playPauseButton)
        view.addSubview(lapsTableView)
        
        let initCircleButton: (UIButton) -> Void = { button in
            button.layer.cornerRadius = 0.5 * button.bounds.size.width
            button.backgroundColor = UIColor.white
        }
        
        initCircleButton(playPauseButton)
        initCircleButton(lapRestButton)
    }

    // MARK: UI Settings
    override var shouldAutorotate: Bool {
        return false
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return UIStatusBarStyle.lightContent
    }
    
    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.portrait
    }
    
    // MARK: -Actions
    @objc func palyRauseTimer(_ sender:AnyObject)  {
        lapRestButton.isEnabled = true
        changeButton(lapRestButton, title: "Lap", titleColor: .black)
        
        if !isPlay {
            unowned let weakSelf = self
            
            mainStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateMainTimer, userInfo: nil, repeats: true)
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            
            RunLoop.current.add(mainStopwatch.timer, forMode: RunLoop.Mode.common)
            RunLoop.current.add(lapStopwatch.timer, forMode: RunLoop.Mode.common)
            
            isPlay = true
            changeButton(playPauseButton, title: "Stop", titleColor: UIColor.red)
        } else {
            
            mainStopwatch.timer.invalidate()
            lapStopwatch.timer.invalidate()
            isPlay = false
            changeButton(playPauseButton, title: "Start", titleColor: UIColor.green)
            changeButton(lapRestButton, title: "Reset", titleColor: UIColor.black)
        }
    }
    
    @objc func lapResetTimer(_ sender: AnyObject) {
        if !isPlay {
            resetMainTimer()
            resetLapTimer()
            changeButton(lapRestButton, title: "Lap", titleColor: UIColor.lightGray)
            lapRestButton.isEnabled = false
        } else {
            if let timerLabelText = timerLabel.text {
                laps.append(timerLabelText)
            }
            lapsTableView.reloadData()
            resetLapTimer()
            unowned let weakSelf = self
            lapStopwatch.timer = Timer.scheduledTimer(timeInterval: 0.035, target: weakSelf, selector: Selector.updateLapTimer, userInfo: nil, repeats: true)
            RunLoop.current.add(lapStopwatch.timer, forMode: RunLoop.Mode.common)
        }
    }
    
    // MARK: -Private Helpers
    fileprivate func changeButton(_ button:UIButton,title:String,titleColor:UIColor) {
        button.setTitle(title, for: .normal)
        button.setTitleColor(titleColor, for:.normal)
    }
    
    fileprivate func resetMainTimer() {
        resetTimer(mainStopwatch,label:timerLabel)
        laps.removeAll()
        lapsTableView.reloadData()
    }
    
    fileprivate func resetLapTimer() {
        resetTimer(lapStopwatch,label:lapTimerLable)
    }
    
    fileprivate func resetTimer(_ stopwatch:Stopwatch,label:UILabel) {
        stopwatch.timer.invalidate()
        stopwatch.counter = 0.0
        label.text = "00:00:00"
    }
    
    @objc func updateMainTimer() {
        updateTimer(mainStopwatch, label: timerLabel)
    }
    
    @objc func updateLapTimer() {
        updateTimer(lapStopwatch, label: lapTimerLable)
    }
    
    func updateTimer(_ stopwatch:Stopwatch,label:UILabel)  {
        stopwatch.counter = stopwatch.counter + 0.035
        var minutes:String = "\((Int)(stopwatch.counter / 60))"
        
        if (Int)(stopwatch.counter / 60) < 10 {
            minutes = "0\((Int)(stopwatch.counter / 60))"
        }
        
        var seconds:String = String(format: "%.2f", (stopwatch.counter.truncatingRemainder(dividingBy: 60)))
        if stopwatch.counter.truncatingRemainder(dividingBy: 60) < 10 {
            seconds = "0"+seconds
        }
        
        label.text = minutes + ":" + seconds
    }
    
    private lazy var timerLabel:UILabel = {
        let lable = UILabel(frame: CGRect(x: 103, y: 62, width: 169, height: 48))
        lable.text = "00:00:00"
        lable.font = UIFont.systemFont(ofSize: 40)
        lable.textAlignment = NSTextAlignment.center
        return lable
    }()
    
    private lazy var lapTimerLable:UILabel = {
        let lable = UILabel(frame: CGRect(x: 200, y: 40, width: 72, height: 21))
        lable.font = UIFont.systemFont(ofSize: 17)
        lable.text = "00:00:00"
        return lable
    }()
    
    private lazy var lapRestButton:UIButton = {
        let btn = UIButton(frame: CGRect(x: 102, y: 234, width: 40, height: 40))
        btn.setTitle("Tap", for: .normal)
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.isEnabled = false
        btn.setTitleColor(.blue, for: .normal)
         btn.addTarget(self, action: #selector(lapResetTimer(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var playPauseButton:UIButton = {
        let btn = UIButton(frame: CGRect(x: 213, y: 234, width: 40, height: 40))
        btn.titleLabel?.font = UIFont.systemFont(ofSize: 15)
        btn.setTitle("Star", for: .normal)
        btn.setTitleColor(.red, for: .normal)
        btn.addTarget(self, action: #selector(palyRauseTimer(_:)), for: .touchUpInside)
        return btn
    }()
    
    private lazy var lapsTableView:UITableView = {
        let table = UITableView(frame: CGRect(x: 0, y: 358, width: 375, height: 309))
        table.delegate = self
        table.dataSource = self
        table.register(JXTableViewCell.self, forCellReuseIdentifier: "lapCell")
        return table
    }()
}

 // MARK: - UITableViewDataSource
extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return laps.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let identifir: String = "lapCell"
        let cell:JXTableViewCell = tableView.dequeueReusableCell(withIdentifier: identifir, for: indexPath) as! JXTableViewCell
        
        cell.countLable?.text = "Lap \(laps.count - (indexPath as NSIndexPath).row)"
        cell.timeLable?.text =  laps[laps.count - (indexPath as NSIndexPath).row - 1]
        return cell
    }
}

// MARK: - Extension
fileprivate extension Selector {
    static let updateMainTimer = #selector(ViewController.updateMainTimer)
    static let updateLapTimer = #selector(ViewController.updateLapTimer)
}

