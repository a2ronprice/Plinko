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
import Network


class LoadViewController: UIViewController {
    @IBOutlet var loadingTicker: UIActivityIndicatorView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadingTicker.layer.cornerRadius = 4
        do {
           try Auth.auth().signOut()
        } catch {
            print("Sign out failed")
        }

        var returningUser = false
        loadingTicker.startAnimating()
        DispatchQueue.global().async {
            if let currentUser = Auth.auth().currentUser {
                print(currentUser.email)
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
    }
    
    override var prefersStatusBarHidden: Bool {
        return true
    }
    
}
