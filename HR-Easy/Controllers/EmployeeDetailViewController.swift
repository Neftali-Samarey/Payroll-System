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
    var gender: String!
    var socialSecurity : String!
    var dob : String!
    var organization: String!
    
    // TODO: Compute the age of the user
    var currentAge = {
        return 10
        // compute the age of this user
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
        detailview.layer.cornerRadius  = 10
        detailview.backgroundColor = UIColor.white
        detailview.center.x = self.view.center.x + 600
        
        // First name
        
        let nameLabel = UILabel(frame: CGRect(x: 170, y: 30, width: detailview.bounds.width - 170, height: 47))
        nameLabel.text = "\(person.name!) \(person.lastName!)"
        nameLabel.font = UIFont(name: "avenir", size: 44)
//        nameLabel.layer.borderWidth = 1
        
        // Position
        let positionLabel = UILabel(frame: CGRect(x: 170, y: 80, width: detailview.bounds.width - 170, height: 24))
        positionLabel.text = person.postion!
        positionLabel.font = UIFont(name: "avenir", size: 24)
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
        var genderLabel = UILabel(frame: CGRect(x: 170, y: 115, width: detailview.bounds.width - 170, height: 25))
        genderLabel.font = UIFont(name: "avenir", size: 21)
        genderLabel.text = "\(person.gender!) DOB: \(person.dob!) (\(person.currentAge as! Int))"  // the last integer will return th eafe as a String
        
        
        
        
        // Subview
        detailview.addSubview(nameLabel)
        detailview.addSubview(positionLabel)
        detailview.addSubview(customImage)
        detailview.addSubview(genderLabel)
        
        UIView.animate(withDuration: 0.3) {
            self.view.addSubview(detailview)
            detailview.center.x = self.view.center.x - 160

        }
        
       
        
    }
    
    
    func slideViewWithDataFromDatabase() {
        
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


