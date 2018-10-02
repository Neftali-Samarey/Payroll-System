//
//  ProfileImageView.swift
//  HR-Easy
//
//  Created by Neftali Samarey on 9/27/18.
//  Copyright © 2018 Neftali Samarey. All rights reserved.
//

import UIKit

class ProfileImageView: UIImageView {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
   
    override func layoutSubviews() {
        super.layoutSubviews()
        self.layer.cornerRadius = self.bounds.size.width/2
        self.clipsToBounds = true
    }

}
