//
//  BHBenefits.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 12/2/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class BHBenefits: NSObject {
    var id : Int?
    var planName : String?
    var planType : String?
    var percentage : String?
    
    override init() {
        // Empty
    }

    init(pId: Int, plan: String, type: String, planPercentage: String) {
        self.id = pId
        self.planName = plan
        self.planType = type
        self.percentage = planPercentage
    }
    
    // Print objects current state
//    override var description: String {
//        return "ID: \(String(describing: id)), Name: \(String(describing: name)), Salary: \(String(describing: salary)), Position: \(String(describing: position))"
//    }
}

