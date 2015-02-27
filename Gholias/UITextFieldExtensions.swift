//
//  UITextFieldExtensions.swift
//  fixity
//
//  Created by QUALIDATA on 10/13/14.
//  Copyright (c) 2014 QUALIDATA. All rights reserved.
//

import Foundation

extension UITextField {
    func setPlaceHolderTextColor(color: UIColor) {
        if self.placeholder != nil && self.placeholder != "" {
            self.attributedPlaceholder = NSAttributedString(string: self.placeholder!, attributes:[NSForegroundColorAttributeName: color] )
        }
    }
    
    func setPadding(left: CGFloat) {
        
        self.layer.sublayerTransform = CATransform3DMakeTranslation(left, 0, 0);
    }
}