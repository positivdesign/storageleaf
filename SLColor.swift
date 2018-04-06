//
//  Color.swift
//  
//
//  Created by Nergis Yıldız Atmaca on 3.04.2018.
//

import UIKit

struct SLColor {
    
    static let barColor = UIColor(rgb: 0x1B5E20)
    static let barColor2 = UIColor(rgb: 0x85B83F)
    static let primary = UIColor(rgb: 0x4CAF50)
    static let barTintColor = UIColor.white
//    static let barStyle = UIColor.blackTranslucent
    
}

extension UIColor {
    convenience init(red: Int, green: Int, blue: Int) {
        assert(red >= 0 && red <= 255, "Invalid red component")
        assert(green >= 0 && green <= 255, "Invalid green component")
        assert(blue >= 0 && blue <= 255, "Invalid blue component")
        
        self.init(red: CGFloat(red) / 255.0, green: CGFloat(green) / 255.0, blue: CGFloat(blue) / 255.0, alpha: 1.0)
    }
    
    convenience init(rgb: Int) {
        self.init(
            red: (rgb >> 16) & 0xFF,
            green: (rgb >> 8) & 0xFF,
            blue: rgb & 0xFF
            
        )
    }
}
