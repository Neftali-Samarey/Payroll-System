//
//  DashboardControllerViewController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/12/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//
//
// THIS IS THE MAIN DASHBOARD THAT ENABLES THE USER OR ADMIN TO ADMINISTER THE FUNCTIONALITIES OF THE PROGRAM
//  

import UIKit

extension UIImageView {
    
    func setRounded(borderWidth: CGFloat = 0.0, borderColor: UIColor = UIColor.clear) {
        layer.cornerRadius = frame.height / 2
        layer.masksToBounds = true
        layer.borderWidth = borderWidth
        layer.borderColor = borderColor.cgColor
    }
}



class DashboardControllerViewController: UIViewController {
    
    @IBOutlet weak var viewEmployeesOption: UIView!
    @IBOutlet weak var employeePayroll: UIView!
    @IBOutlet weak var database: UIView!
    @IBOutlet weak var profileImageView: UIImageView!
    @IBOutlet weak var profileNameLabel: UILabel!
    @IBOutlet weak var profileRoleLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    var topNavigation = TopNavigation()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white
        self.title = "Dashboard"
        styleDashboard()
        createFakeAdmin()
        setDateComponent()
        print("Current: \(Modules.getFormattedDate())")
    }
    
    func createFakeAdmin() {
        var adriana = User(name: "Adriana ", lastname: "Sevilla", admin: true, password: "sevilla00", role: .Admin)
        self.profileNameLabel.text = adriana.name + adriana.lastName
        self.profileRoleLabel.text = "Admin"
    }

    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        self.profileImageView.setRounded(borderWidth: 3.0, borderColor: UIColor.white)
    }
    
    fileprivate func setDateComponent() {
        self.dateLabel.text = Modules.getFormattedDate()
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Setting up initial controls for the user
    func setNavigationController() {
        topNavigation.frame = CGRect(x: 10, y: 110, width: 355, height: 70)
        topNavigation.layer.shadowColor = UIColor.gray.cgColor
        topNavigation.layer.shadowOpacity = 1
        topNavigation.layer.shadowOffset = CGSize.zero
        topNavigation.layer.shadowRadius = 2.4
        self.view.addSubview(topNavigation)
    }
    
    func styleDashboard() {
        self.viewEmployeesOption.layer.cornerRadius = 8
        self.employeePayroll.layer.cornerRadius = 8
        self.database.layer.cornerRadius = 8
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

    func initiaLoginController() {
        let loginController = ViewController()
        self.present(loginController, animated: false, completion: nil)
    }

    
}
