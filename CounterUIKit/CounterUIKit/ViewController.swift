//
//  ViewController.swift
//  CounterUIKit
//
//  Created by JOHNNY_MAC_1 on 2023/06/09.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var numberLabel: UILabel!
    
    var number: Int = 0
    var iNumInterval: Int = 1
    var bIsRunning: Bool = false
    
    let dInterval = 1.0
    var m_objTimer: DispatchSourceTimer?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        numberLabel.text = "\(number)"
        
        if m_objTimer == nil {
            m_objTimer = DispatchSource.makeTimerSource(flags: [], queue: DispatchQueue.main)
            m_objTimer?.schedule(deadline: .now(), repeating: 1)
            m_objTimer?.setEventHandler(handler: updateTime)
        }
    }
    
    deinit {
        if m_objTimer != nil {
            m_objTimer?.cancel()
            m_objTimer = nil
        }
    }
    
    @objc func updateTime(){
        number += iNumInterval
        numberLabel.text = "\(number)"
    }
    
    @IBAction func actionUp(_ sender: Any) {
        if !bIsRunning {
            m_objTimer?.resume()
            bIsRunning = true
        }
        print("up")
        
        iNumInterval = 1
//        number += 1
//        numberLabel.text = "\(number)"
    }
    
    @IBAction func actionUp10(_ sender: Any) {
        if !bIsRunning {
            m_objTimer?.resume()
            bIsRunning = true
        }
        print("up")
        
        iNumInterval = 10
//        number += 10
//        numberLabel.text = "\(number)"
    }
    
    @IBAction func actionDown(_ sender: Any) {
        if !bIsRunning {
            m_objTimer?.resume()
            bIsRunning = true
        }
        print("down")
        
        iNumInterval = -1
//        number -= 1
//        numberLabel.text = "\(number)"
    }
    
    @IBAction func actionDown10(_ sender: Any) {
        if !bIsRunning {
            m_objTimer?.resume()
            bIsRunning = true
        }
        print("down")
        
        iNumInterval = -10
//        number -= 10
//        numberLabel.text = "\(number)"
    }
    
    @IBAction func actionStop(_ sender: Any) {
        if bIsRunning {
            m_objTimer?.suspend()
            bIsRunning = false
        }
    }
    
    @IBAction func actionReset(_ sender: Any) {
        number = 0
        numberLabel.text = "\(number)"
    }
}

