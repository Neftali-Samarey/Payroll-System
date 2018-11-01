//
//  DetailData.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 10/9/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class DetailData: UIView {
    
    var defaultLabel = UILabel()
    
    public var myLabel : UILabel = {
        let label = UILabel()
        label.frame = CGRect(x: 100, y: 100, width: 300, height: 35)
        label.text = "Working well"
        return label
    }()
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.addSubview(myLabel)
    }
    
   
    
}
