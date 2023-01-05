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

        if let currentUser = Auth.auth().currentUser {
            // grab user data from firebase
        } else {
            print("failed to load current user")
        }
            
    }

    
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
}

