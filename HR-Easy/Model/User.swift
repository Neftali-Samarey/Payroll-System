//
//  User.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/11/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit

class User {
    
    var name : String!
    var lastName: String!
    var isAdmin : Bool!
    var password: String!
    
    init(name: String, lastname: String, admin: Bool, password: String) {
        self.name = name
        self.lastName = lastname
        self.isAdmin = admin
        self.password = password
    }
    
    func generateUsername(name: String, lastname: String) -> String {
        return name + lastname
    }
    
}
