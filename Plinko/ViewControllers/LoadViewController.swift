//
//  LoadViewController.swift
//  Plinko
//
//  Created by Aaron  Price on 12/31/22.
//

import Foundation
import UIKit
import FirebaseCore
import FirebaseAuth


class LoadViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        var returningUser = false
        
        DispatchQueue.global().async {
            if let currentUser = Auth.auth().currentUser {
                returningUser = true
            } else {
                returningUser = false
            }
          DispatchQueue.main.async {
              if returningUser {
                  self.performSegue(withIdentifier: "LoadToMain", sender: self)
              } else {
                  self.performSegue(withIdentifier: "LoadToSignUp", sender: self)
              }
          }
        }
        
        // Do any additional setup after loading the view.
  /*      if let user = Auth.auth().currentUser {
            print("Segue to Returning User")
            performSegue(withIdentifier: "LoadToMain", sender: self)
    }
        else {
            print("Segue to Sign Up")
            performSegue(withIdentifier: "LoadToSignUp", sender: self)
        }
   */
        
        
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
    
}
