//
//  EmployeeTableViewCell.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/25/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class EmployeeTableViewCell: UITableViewCell {

    // Cell variables
    @IBOutlet weak var employeeProfileImageView: ProfileImageView!
    @IBOutlet weak var employeeFullNameLabel: UILabel!
    @IBOutlet weak var employeeJobFunctionLabel: UILabel!
    
    
//    func viewWillLayoutSubviews() {
//        self.employeeProfileImageView.setRounded(borderWidth: 3.0, borderColor: UIColor.white)
//    }
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
