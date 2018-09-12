//
//  ViewController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/11/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//
// User Login

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var loginViewBox: UIView!
    func userDidLoginSuccessfully() -> Bool {
        return true
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        title = "Login"
        initializeStyling()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    fileprivate func initializeStyling() {
        loginViewBox.layer.cornerRadius = 10
    }


}

