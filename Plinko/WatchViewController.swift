//
//  WatchViewController.swift
//  Plinko
//
//  Created by Aaron  Price on 12/29/22.
//

import Foundation
import UIKit
import WebKit

class WatchViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var webview: WKWebView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string: "https://www.w3schools.com/html/mov_bbb.mp4")!
        webview.load(URLRequest(url: url))
        webview.allowsBackForwardNavigationGestures = false
        // Do any additional setup after loading the view.
    }


override var prefersStatusBarHidden: Bool {
    return true
}
}
