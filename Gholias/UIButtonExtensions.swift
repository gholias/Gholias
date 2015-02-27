//
//  UIButtonExtensions.swift
//  SGPmobile
//
//  Created by Felipe Oliveira on 1/22/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

import Foundation
extension UIButton {
    func fixBackground() {
        self.fixBackground(false)
    }
    
    func fixBackground(useShadow:Bool) {
        self.setBackgroundImage(self.backgroundColor?.convertImage(), forState: UIControlState.Normal)
        if useShadow {
            self.layer.shadowColor = self.backgroundColor?.darkerColor().CGColor
            self.layer.shadowOffset = CGSize(width:0, height:3)
            self.layer.shadowOpacity = 0.7
            self.layer.shadowRadius = 0
        }
        self.backgroundColor = UIColor.clearColor()
    }

}