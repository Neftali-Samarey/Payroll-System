//
//  ViewController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/11/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//
// User Login

import UIKit
import FirebaseAuth


class ViewController: UIViewController, UITextFieldDelegate {
    
 
   
    @IBOutlet weak var overlayBackground: UIView!
    
    // Outlets for the main interface (login)
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var containerYConstraint: NSLayoutConstraint!
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    var loginAttempsCounter = 0
    let MAX_ATTEMPTS = 3
     let appDelegate = UIApplication.shared.delegate! as! AppDelegate
    
    var sampleUsers = [User]()
    
    // Keep a ref to the users
//    let ref = Database.database().reference(withPath: "users")
    
    
   
    override func viewDidLoad() {
        super.viewDidLoad()
        overlayBackground.layer.backgroundColor  = UIColor.corporateBlue().cgColor
        overlayBackground.layer.opacity = 0.4
        
        navigationController?.navigationBar.isHidden = true
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(self.dismissKeyboard))
        title = "Login"
        self.usernameField.delegate = self
        self.passwordField.delegate = self
        //showKeyboard() // will fix this later
        

        createUsers()
        self.view.addGestureRecognizer(tap)
       //r self.usernameField.becomeFirstResponder()
    }

    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func login(_ sender: Any) {
        
        guard usernameField.text != "" else {
            showAlert(withTitle: "Error", message: "No username entered")
            return
        }
        guard passwordField.text != "" else {
            showAlert(withTitle: "Error", message: "No password entered")
            return
        }
        
       // Sign the users in
        logUserWith(name: usernameField.text!, password: passwordField.text!)
    }
    
    
    func showKeyboard() {
        UIView.animate(withDuration: 0.3) {
            self.usernameField.becomeFirstResponder()
            self.containerYConstraint.constant = -100
            
        }
    }
    
    // MARK: - SAMPLE USERS, NOT ON FIREBASE YET
    func createUsers() {
        let admin = User(name: "Roberto", lastname: "Merlos", admin: true, password: "rmerlos18", role: .Employee)
        sampleUsers.append(admin)
        let staff = User(name: "Abe", lastname: "Abe", admin: false, password: "abe18^", role: .Employee)
        sampleUsers.append(staff)
    }
    
    // NOT BEING USED AT THE MOMENT
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "loginSession" {
            
        }
    }
    
    
    
    func logUserWith(name: String, password: String) {
        
        

        
        // Iterate through the array (database) of users to find the users
//        for users in sampleUsers {
//            if name != users.name || password != users.password {
//                UIView.animate(withDuration: 3, animations: {
//                    // 1
//                    self.showAlert(withTitle: "Invalid Login", message: "Login was unsucessfull, please try again")
//                }) { (true) in
//                    // 2
//
//                }
//            } else {
//                print("Found User")
//            }
//        }
        
        // Log the user in
        

        if name != "nef" || password != "test" {
        loginAttempsCounter += 1 /// hold a reference to the next account login count
        
            print("Number of attempts \(loginAttempsCounter)")
            if loginAttempsCounter > MAX_ATTEMPTS {
                showAlert(withTitle: "Too many attempts", message: "You have tried the allowed login attempts")
                // disable the interface from attempting more tries
                disableControls()
                showContactSupport()
            }
        } else {
           
//            let dashboardController = DashboardControllerViewController()
//            let navigation = UINavigationController(rootViewController: dashboardController)
//            navigation.modalTransitionStyle = .flipHorizontal
//            self.present(navigation, animated: true, completion: nil)
            
        
            
//            appDelegate.window?.rootViewController = tabBar
//            appDelegate.window?.makeKeyAndVisible()
            
            
            
            
//            let initialViewController = self.storyboard!.instantiateViewController(withIdentifier: "MainTab")
//            appDelegate.window?.rootViewController = initialViewController
//            appDelegate.window?.makeKeyAndVisible()
        }
        
       
        
       
    }
    
    
    
    // MARK: Diable the controls
    func disableControls() {
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        self.usernameField.isEnabled = false
        self.passwordField.isEnabled = false
        self.loginButton.isEnabled = false
    
        self.resignFirstResponder()
    }
    
    func showContactSupport() {
        
        let resetPassview = UIView(frame: CGRect(x: 10, y: -50, width: self.view.bounds.width - 20, height: 40))
        let contactText = UILabel(frame: CGRect(x: 0, y: 0, width: resetPassview.bounds.width, height: 40))
        resetPassview.layer.cornerRadius = 8
        resetPassview.backgroundColor = UIColor.red
        contactText.text = "Contact Support"
        contactText.textColor = UIColor.white
        contactText.textAlignment = .center
        UIView.animate(withDuration: 0.3) {
            resetPassview.center.y = 50
            self.view.addSubview(resetPassview)
            resetPassview.addSubview(contactText)
        }
        
    }
    

    //MARK: - TEXTFIELD DELEGATES
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        passwordField.becomeFirstResponder()
       return true
    }
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        if textField.becomeFirstResponder() {
            UIView.animate(withDuration: 0.3) {
                self.containerYConstraint.constant = -100
                self.view.layoutIfNeeded()
            }
        }
    }
    
    //
    @objc func dismissKeyboard() {
        self.usernameField.resignFirstResponder()
        self.passwordField.resignFirstResponder()
        UIView.animate(withDuration: 0.3) {
            self.containerYConstraint.constant = -50
            self.view.layoutIfNeeded()
        }
    }
  


}

