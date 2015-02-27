//
//  UIColorExtensions.swift
//  cantorcristao
//
//  Created by Felipe Oliveira on 9/16/14.
//  Copyright (c) 2014 Felipe Oliveira. All rights reserved.
//

import Foundation
import UIKit

public extension UIColor {
    
    convenience init(rgb: UInt, alpha:CGFloat) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(alpha)
        )
    }
    
    convenience init(rgb: UInt) {
        self.init(rgb: rgb, alpha: 1.0)
    }
    
    func convertImage() -> UIImage {
        var rect : CGRect = CGRectMake(0, 0, 1, 1)
        UIGraphicsBeginImageContext(rect.size)
        var context : CGContextRef = UIGraphicsGetCurrentContext()
        
        CGContextSetFillColorWithColor(context, self.CGColor)
        CGContextFillRect(context, rect)
        
        var image: UIImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        return image
    }
    
    func darkerColor() -> UIColor {
        
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        return UIColor(hue: h, saturation: s, brightness: b*0.75, alpha: a)
    }
    
    func lighterColor() -> UIColor {
        
        var h: CGFloat = 0
        var s: CGFloat = 0
        var b: CGFloat = 0
        var a: CGFloat = 0
        
        self.getHue(&h, saturation: &s, brightness: &b, alpha: &a)
        
        return UIColor(hue: h, saturation: s, brightness: min(b * 1.3, 1.0), alpha: a)
    }
}