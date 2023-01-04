//
//  ViewController.swift
//  Plinko
//
//  Created by Aaron  Price on 12/25/22.
//

import UIKit
import FirebaseCore
import FirebaseAuth

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        DispatchQueue.global().async {
            if let currentUser = Auth.auth().currentUser {
                print("Display name")
                print(currentUser.displayName)
            }
            
            DispatchQueue.main.async {
          }
        }
    }

    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

