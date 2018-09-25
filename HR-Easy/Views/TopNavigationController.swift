//
//  TopNavigationController.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/24/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import Foundation
import UIKit


protocol DidSelectOptionsWithin : class {
    func selectedItemWith() // generic
}


class TopNavigation: UIView {
    
    var itemStack = UIStackView()
    var label: UILabel = UILabel()
    
    
    
    override init(frame: CGRect) {
        
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.white
        self.label.frame = CGRect(x: 0, y: 10, width: 320, height: 34)
        self.label.text = "This is the label working"
        

        self.layer.cornerRadius = 7
        
        self.addSubview(label)

    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    fileprivate func prepareForAutoLayout(status: Bool) {
        if status == true {
            self.translatesAutoresizingMaskIntoConstraints = false
        }
    
    }
    
    
}

