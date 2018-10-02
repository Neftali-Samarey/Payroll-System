//
//  Person.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/25/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import Foundation

enum Role {
    case Engineer
    case HumanResource
    case ClientServices
    case Administration
    case Doctor
    case Nurse
    case Intern
    
    var postionType : String {
        
        switch self {
        case .Engineer:
            return "Software Engineer"
        case .HumanResource:
            return "HR"
        case .ClientServices:
            return "Client Services"
        case .Administration:
            return "Administration"
        case .Doctor:
            return "General Doctor"
        case .Nurse:
            return "Nurse"
        case .Intern:
            return "Intern"
      
        }
    }
}


class Person {
    
    var name : String!
    var lastName: String!
    var ssn : Int!
    var role: Role!
    var isEmployed: Bool!
    var profileImage  : String 
    
    
    // Set the user info
    init(personName: String, personLastname: String, ssn: Int, userRole: Role, employed: Bool, image: String) {
        self.name = personName
        self.lastName = personLastname
        self.ssn = ssn
        self.role = userRole
        self.isEmployed = employed
        self.profileImage = image
    }
    
   
    
}
