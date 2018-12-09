//
//  Helpers.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/12/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit

extension UIViewController {
    
    func showAlert(withTitle title: String?, message: String?) {
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Got it", style: .cancel, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
}

extension String {
    
    func CGFloatValue() -> CGFloat? {
        guard let doubleValue = Double(self) else {
            return nil
        }
        
        return CGFloat(doubleValue)
    }
}


