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
    
    override init() {
        // Empty
    }
    
    init(pId: String, pName: String, pSalary: String, pPosition: String, lastname: String, gender: String, dob: String) {
        self.id = pId
        self.name = pName
        
        self.salary = pSalary
        self.position = pPosition
        
        self.lastname = lastname
        self.gender = gender
        self.dob = dob
        
    }
    
    // Print objects current state
    override var description: String {
        return "ID: \(String(describing: id)), Name: \(String(describing: name)), Salary: \(String(describing: salary)), Position: \(String(describing: position))"
    }
}
