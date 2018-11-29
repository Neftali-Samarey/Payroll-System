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

class EmployeeDetailViewController: UIViewController {

    var doesHaveData = true
    var selectedCell = false
    var tableItemCount = 0
    @IBOutlet weak var childView: UIView!
    
    
    @IBOutlet weak var childTrailingConstraint: NSLayoutConstraint! // target
    @IBOutlet weak var childLeadingConstraint: NSLayoutConstraint! // bottom
    @IBOutlet weak var childLeadingSafeConstraint: NSLayoutConstraint! // leading
    @IBOutlet weak var childTopSafeConstraint: NSLayoutConstraint! // safe top
    
    
    // Child view properties
    @IBOutlet weak var nameLabelTest: UILabel!
    
    
    var delegate : UserDidSelectCellDelegate? = nil
    
    var defaultConstraintValueAxis = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
         self.extendedLayoutIncludesOpaqueBars = true
        self.layChildsubviewsStyling()
        // Do any additional setup after loading the view.
    }
    
    func layChildsubviewsStyling() {
        self.childView.layer.cornerRadius = 8
        self.childTrailingConstraint.constant = calculateScreenSizeWidth()
        
        
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
            self.childTrailingConstraint.constant = 3
            
        }) { (true) in
            // Seocndary option to animation
        }
        
    }
    
    func calculateScreenSizeWidth() -> CGFloat {
        let localWidth : CGFloat = self.view.bounds.size.width
        return localWidth
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


