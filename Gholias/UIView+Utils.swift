//
//  UIView+Utils.swift
//  Optimus
//
//  Created by Felipe Oliveira on 4/21/15.
//  Copyright (c) 2015 Hearst TV. All rights reserved.
//




import Foundation

extension UIView {
    
    //Usage view.roundCorners(.TopLeft | .BottomLeft, radius: 10)
    func roundCorners(corners:UIRectCorner, radius: CGFloat) {
        let path = UIBezierPath(roundedRect: self.bounds, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        let mask = CAShapeLayer()
        mask.path = path.CGPath
        self.layer.mask = mask
    }
}