//
//  SampleUserbase.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/27/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit

class SampleUserbase {
    
    var users = [Person]()
    
    init() {
        users.append(Person(personName: "Matt", personLastname: "Galvin", ssn: 12346262, userRole: .Engineer, employed: true, image: "user.jpg"))
        users.append(Person(personName: "Alex", personLastname: "Apple", ssn: 34398234, userRole: .Doctor, employed: true, image: "alx.jpg"))
        users.append(Person(personName: "Renato", personLastname: "Albin", ssn: 29292929, userRole: .ClientServices, employed: true, image: "rnt.jpg"))
        users.append(Person(personName: "Amanda", personLastname: "Jello", ssn: 29292929, userRole: .Intern, employed: true, image: "amd.jpg"))
        users.append(Person(personName: "Nef", personLastname: "Samarey", ssn: 20202033, userRole: .Intern, employed: true, image: ""))
    }
}
