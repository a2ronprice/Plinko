//
//  PlayViewController.swift
//  Plinko
//
//  Created by Aaron  Price on 12/30/22.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth

class PlayViewController: UIViewController {
    
    @IBOutlet var timerLabel: UILabel!
    var timer = Timer()
    var seconds = 20
    
    func runTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(PlayViewController.updateTimer)), userInfo: nil, repeats: true)
    }
    
    @objc func updateTimer() {
        seconds -= 1
        timerLabel.textAlignment = NSTextAlignment.center
        timerLabel.text = String(seconds)
        if (seconds == 0) {
            timer.invalidate()
        }
        
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        timerLabel.text = String(seconds)
        runTimer()        // Do any additional setup after loading the view.
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}


