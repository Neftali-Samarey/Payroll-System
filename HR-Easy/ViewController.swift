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
    
    @IBOutlet weak var containerYConstraint: NSLayoutConstraint!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    var sampleUsers = [User]()
    

    override func viewDidLoad() {
        super.viewDidLoad()
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        title = "Login"
        showKeyboard()
        createUsers()
        self.view.addGestureRecognizer(tap)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        guard usernameField.text != "" else {
            print("Empty username")
            return
        }
        guard passwordField.text != "" else {
            print("Empty password")
            return
        }
        
       // Sign the users in
        logUserWith(name: usernameField.text!, password: passwordField.text!)
    }
    
    
    func showKeyboard() {
        UIView.animate(withDuration: 0.3) {
             self.containerYConstraint.constant = -100
             self.usernameField.becomeFirstResponder()
        }
        
        
    }
    
    // MARK: - SAMPLE USERS, NOT ON FIREBASE YET
    func createUsers() {
        let admin = User(name: "Roberto", lastname: "Merlos", admin: true, password: "rmerlos18")
        sampleUsers.append(admin)
        let staff = User(name: "Abe", lastname: "Abe", admin: false, password: "abe18^")
        sampleUsers.append(staff)
    }
    
    func logUserWith(name: String, password: String) {
        
        // Iterate through the array (database) of users to find the users
        for users in sampleUsers {
            if name != users.name || password != users.password {
                UIView.animate(withDuration: 3, animations: {
                    // 1
                    self.usernameField.layer.borderColor = UIColor.red.cgColor
                    self.usernameField.layer.borderWidth = 3
                    print("executed")
                }) { (true) in
                    // 2
                
                  
                }
            } else {
                print("Found User")
            }
        }
      
    }
    
    // 
    @objc func dismissKeyboard() {
        self.usernameField.resignFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.containerYConstraint.constant = -50
            self.view.layoutIfNeeded()
        }
    }
  


}

