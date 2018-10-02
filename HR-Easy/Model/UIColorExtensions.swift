//
//  UIColorExtensions.swift
//
//  Created by Mihails Tumkins on 10/02/15.
//

import UIKit

extension UIColor {
    
    convenience init(r: Int, g:Int , b:Int) {
        self.init(red: CGFloat(r)/255, green: CGFloat(g)/255, blue: CGFloat(b)/255, alpha: 1.0)
    }
  
    class func cleanBlack()->UIColor {
        return UIColor(r: 25, g: 25, b: 25)
    }
    
    class func cleanWhite()->UIColor {
        return UIColor(r: 245, g: 246, b: 250)
    }
    
    class func cleanGray()->UIColor {
        return UIColor(r: 217, g: 217, b: 217)
    }
    
    class func blackFont()->UIColor {
        return UIColor(r: 47, g: 53, b: 66)
    }
    
    class func blackPearl()->UIColor {
        return UIColor(r: 30, g: 39, b: 46)
    }
    
    class func corporateBlue()->UIColor {
        return UIColor(r: 30, g: 144, b: 255)
    }

}
