//
//  ServedData.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 10/10/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class UserModel: NSObject {
    
    var id : String?
    var name : String?
    var position : String?
    var salary : String?
    
    // Extended Data
    var lastname : String?
    var gender: String?
    var dob: String?
    var maritalStatus: String?
    var ssn : String?
    var dependents: String?
    var organization_2 : String?
    var dept : String?
    var start: String?
    
    var hoursWorked: String?

    
    override init() {
        // Empty
    }
    
    init(pId: String, pName: String, pSalary: String, pPosition: String, lastname: String, gender: String, dob: String, marital: String, ssn: String,
         dependents: String, organization_2: String, dept: String, start: String, hoursWorked: String) {
        self.id = pId
        self.name = pName
        
        self.salary = pSalary
        self.position = pPosition
        
        self.lastname = lastname
        self.gender = gender
        self.dob = dob
        self.maritalStatus = marital
        self.ssn = ssn
        self.dependents = dependents
        self.organization_2 = organization_2
        self.dept = dept
        self.start = start
        self.hoursWorked = hoursWorked
        
    }
    
    // Print objects current state
    override var description: String {
        return "ID: \(String(describing: id)), Name: \(String(describing: name)), Salary: \(String(describing: salary)), Position: \(String(describing: position))"
    }
}
