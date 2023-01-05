//
//  InternetViewController.swift
//  Plinko
//
//  Created by Aaron  Price on 1/5/23.
//

import Foundation
import UIKit
import Network

class InternetViewController: UIViewController {
    @IBOutlet var internetLabel: UILabel!
    @IBOutlet var instructionLabel: UILabel!
    @IBOutlet var loadingTicker: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingTicker.layer.cornerRadius = 4
        loadingTicker.isHidden = false
        loadingTicker.startAnimating()
        internetLabel.isHidden = true
        instructionLabel.isHidden = true
        monitorNetwork()
    }

    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    func monitorNetwork() {
        let monitor = NWPathMonitor()
        monitor.pathUpdateHandler = { path in
            if path.status == .satisfied {
                DispatchQueue.main.async {
                    self.performSegue(withIdentifier: "InternetToLoad", sender: self)
                }
            } else {
                DispatchQueue.main.async {
                    self.loadingTicker.isHidden = true
                    self.instructionLabel.isHidden = false
                    self.internetLabel.isHidden = false
                }
                
                
            }
            
            
            
        }
        let queue = DispatchQueue(label: "Network")
        monitor.start(queue: queue)
        
        
        
        
        
    }
}

