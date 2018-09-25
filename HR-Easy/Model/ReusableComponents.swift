//
//  ReusableComponents.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/25/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit

class Modules {
    
    static func getDateFormattedWith() -> Date {
        let date = NSDate()
        return date as Date
    }
    
    // gets the formatted date for the UI component
    static func getFormattedDate() -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMM dd, yyyy"
        let today = dateFormatter.string(from: getDateFormattedWith())
        // COnvert the date to string
        return today
}

}
