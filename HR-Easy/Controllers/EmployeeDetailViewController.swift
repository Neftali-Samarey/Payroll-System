//
//  EmployeeDetailViewController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/27/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//
// UISPlitViewContoller delegates in this controller
import UIKit

protocol UserDidSelectCellDelegate: class {
    func userSelectedCellWith()
}


struct Entity {
    var name: String!
    var lastName: String!
    var postion: String!
    var employeeId : String!
    var gender: String!
    var socialSecurity : String!
    var dob : String!
    var organization: String!
    
    var maritalStatus: String!
    var dependents: String!
    var organization_2: String!
    var dept : String!
    var start: String!
    var salary: String! // Hourly
    var hoursWorked: String!
    
    var finalSalary : Double { // payrate * 0.0745
        
        let localSalary = Double(salary)
        let localHours = Double(hoursWorked)
        let overall = (localHours! * localSalary!)
        let newRate = ( overall * overall) * 0.0745
        
        let overall_2 = Double(localSalary! * localHours! - (localSalary! * localHours! * 0.0745))
        return overall_2
    }
    
    // TODO: Compute the age of the user
    var currentAge : Int {
        var currentDate : Date
        // covnert the users age from string to date, then calculate the date based on todays date to get the age
        return 0
    }
    
}

class EmployeeDetailViewController: UIViewController {

    var doesHaveData = true
    var selectedCell = false
    var tableItemCount = 0
    @IBOutlet weak var childView: UIView!
    
    var didSelectAnotherUser = false
    
    
    @IBOutlet weak var childTrailingConstraint: NSLayoutConstraint! // target
    @IBOutlet weak var childLeadingConstraint: NSLayoutConstraint! // bottom
    @IBOutlet weak var childLeadingSafeConstraint: NSLayoutConstraint! // leading
    @IBOutlet weak var childTopSafeConstraint: NSLayoutConstraint! // safe top
    
    
    // Child view properties
    @IBOutlet weak var nameLabelTest: UILabel!
    
    var person = Entity()
    
    var unpaidColor = UIColor()
    var payButton = UIButton()
    var payRateLabel = UILabel()
    
    
    
    var delegate : UserDidSelectCellDelegate? = nil
    
    var defaultConstraintValueAxis = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.extendedLayoutIncludesOpaqueBars = true
        self.layChildsubviewsStyling()
        // Do any additional setup after loading the view.
    }
    
    func layChildsubviewsStyling() {
//        self.childView.layer.cornerRadius = 8
//        self.childTrailingConstraint.constant = calculateScreenSizeWidth()
        
        
    }
    
    // TEST: ANIMATION SLIDE IN WHEN TABLECELL IS SELECTED
    override func viewWillAppear(_ animated: Bool) {
        
        super.viewWillAppear(animated)
        if doesHaveData {
            // Slide the view into place
            slideInView()
        } else {
         print("No Data")
        }
    }
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
       
    }
    
    func slideInView() {
        UIView.animate(withDuration: 0.3, animations: {
            // initiat state, then layoutIfNeeded()
            //self.childTrailingConstraint.constant = 3
            
        }) { (true) in
            // Seocndary option to animation
        }
        
    }
    
    
    
    func calculateScreenSizeWidth() -> CGFloat {
        let localWidth : CGFloat = self.view.bounds.size.width
        return localWidth
    }
    
    
    // PROGRAMMTIC APPROACH
    func slideViewWithData() {
        
        let detailview = UIView(frame: CGRect(x: 10, y: 80, width: 680, height: 620))
        detailview.layer.cornerRadius  = 6
        detailview.backgroundColor = UIColor.white
        detailview.center.x = self.view.center.x + 600
        
        // First name
        
        let nameLabel = UILabel(frame: CGRect(x: 170, y: 30, width: detailview.bounds.width - 170, height: 47))
        nameLabel.text = "\(person.name!) \(person.lastName!)"
        nameLabel.font = UIFont(name: "avenir", size: 44)
//        nameLabel.layer.borderWidth = 1
        
        // Position
        let positionLabel = UILabel(frame: CGRect(x: 170, y: 80, width: detailview.bounds.width - 170, height: 24))
        positionLabel.text = "\(person.postion!) \t Employee ID: \(person.employeeId!)"
        positionLabel.font = UIFont(name: "avenir", size: 19)
        positionLabel.textColor = UIColor.gray
//        positionLabel.layer.borderWidth = 1
        
        // Image object
        
        let customImage = ProfileImageView.init(frame: CGRect(x: 15, y: 15, width: 120, height: 120))
        // check if male or female
        if person.gender! == "Male" {
            customImage.image = UIImage(named: "alx.jpg")
        } else if person.gender! == "Female"{
            customImage.image = UIImage(named: "user.jpg")
        }
 
        
        
        // Gender label
        let genderLabel = UILabel(frame: CGRect(x: 170, y: 115, width: detailview.bounds.width - 170, height: 25))
        genderLabel.font = UIFont(name: "avenir", size: 21)
        genderLabel.text = "\(person.gender!) | DOB: \(person.dob!))"  // the last integer will return th eafe as a String
        
        
        // Salary Label
        let horizontalLabel = UILabel(frame: CGRect(x: 10, y: 150, width: detailview.bounds.width, height: 34))
        horizontalLabel.font = UIFont(name: "avenir", size: 25)
        horizontalLabel.textAlignment = .left
        horizontalLabel.textColor = UIColor.gray
        horizontalLabel.text = "General Info"
        
        // More of the General information
        
        let informationLabel = UILabel(frame: CGRect(x: 10, y: 190, width: detailview.bounds.width, height: 20))
        informationLabel.font = UIFont(name: "avenir", size: 18)
        informationLabel.text = "Marital Status: \(person.maritalStatus!) \t SSN: \(person.socialSecurity!) \t Dependents: \(person.dependents!)"
        
        let horizontalLabel2 = UILabel(frame: CGRect(x: 10, y: 220, width: detailview.bounds.width, height: 34))
        horizontalLabel2.font = UIFont(name: "avenir", size: 25)
        horizontalLabel2.textColor = UIColor.gray
        horizontalLabel2.textAlignment = .left
        horizontalLabel2.text = "Employment Info"
        
        let employmentLabel = UILabel(frame: CGRect(x: 10, y: 260, width: detailview.bounds.width, height: 80))
        employmentLabel.font = UIFont(name: "avenir", size: 18)
        employmentLabel.numberOfLines = 4
        employmentLabel.text = "Organization: \(person.organization_2!) \t Department: \(person.dept!) \t \n Start Date: \(person.start!) Hours Worked: \(person.hoursWorked!)\n Salary (p/hour): \(person.salary!)"
        
        unpaidColor = UIColor.sunflowerColor()
       
        
        payRateLabel = UILabel(frame: CGRect(x: 10, y: 350, width: detailview.bounds.width - 30, height: 22))
        payRateLabel.font = UIFont(name: "avenir", size: 20)
        payRateLabel.textAlignment = .right
        payRateLabel.textColor = UIColor.red
        payRateLabel.text = "Payment Due: $\(person.finalSalary)"
        
        
        /// Pay button
        
        payButton = UIButton(frame: CGRect(x: 230, y: 400, width: 200, height: 60))
        payButton.setTitle("Pay \(person.name!)", for: .normal)
        payButton.backgroundColor = unpaidColor
        payButton.addTarget(self, action: #selector(self.comfirmPay), for: .touchUpInside)
        
        
        // Subview
        detailview.addSubview(nameLabel)
        detailview.addSubview(positionLabel)
        detailview.addSubview(customImage)
        detailview.addSubview(genderLabel)
        detailview.addSubview(horizontalLabel)
        detailview.addSubview(informationLabel)
        detailview.addSubview(horizontalLabel2)
        detailview.addSubview(employmentLabel)
        detailview.addSubview(payRateLabel)
        detailview.addSubview(payButton)
        
        
        UIView.animate(withDuration: 0.3) {
            self.view.addSubview(detailview)
            detailview.center.x = self.view.center.x - 160

        }
        
       
        
    }
    
      var alert = SweetAlert() // using as a ref
    
    func slideViewWithDataFromDatabase() {
        
    }
    
    
    @objc func comfirmPay() {
//        SweetAlert().showAlert("Comfirm", subTitle: "Subtitle", style: .warning, buttonTitle: "OK", buttonColor: UIColor.emeraldColor(), otherButtonTitle: "Cancel")
    
        SweetAlert().showAlert("Comfirm Payment", subTitle: "Are you sure you want to make a direct deposit to \(person.name!) ?", style: AlertStyle.warning, buttonTitle:"Cancel", buttonColor:UIColor.sunflowerColor() , otherButtonTitle:  "Pay", otherButtonColor: UIColor.fRedColor()) { (isOtherButton) -> Void in
            if isOtherButton == true {
                
                print("Cancel Button  Pressed")
            }
            else {
                SweetAlert().showAlert("Payed!", subTitle: "You've payed \(self.person.name!) a total of $\(self.person.finalSalary)", style: AlertStyle.success)
                // Animte view
                DispatchQueue.main.async(execute: { () -> Void in
                    UIView.animate(withDuration: 0.3, animations: {
                        self.payButton.backgroundColor = UIColor.emeraldColor()
                        self.payButton.setTitle("PAID", for: .normal)
                        self.payButton.isEnabled = false
                        self.payRateLabel.textColor = UIColor.emeraldColor()
                        self.payRateLabel.text = "$00.00"
                    })
                })
               
                // End
            }
        }
        
//        SweetAlert().showAlert("Comfirm", subTitle: "Subtitle", style: .warning, buttonTitle: "Ok", buttonColor: UIColor.emeraldColor(), otherButtonTitle: "Cancel") { (true) in
//            // Rest of the code
//        }

    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}


