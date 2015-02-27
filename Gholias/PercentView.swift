//
//  PercentView.swift
//  Tracking
//
//  Created by Rafael Machado on 1/21/15.
//  Copyright (c) 2015 TTI. All rights reserved.
//

import UIKit

@IBDesignable public class PercentView: UIView {
    
    private let ring = CAShapeLayer()
    private let backgroundRing = CAShapeLayer()
    
    @IBInspectable var lineWidth: CGFloat = 1 {
        didSet {
            setupUI()
        }
    }
    
    @IBInspectable var ringColor: UIColor = UIColor.blackColor() {
        didSet {
            setupUI()
        }
    }
    
    @IBInspectable var bgRingColor: UIColor = UIColor.grayColor() {
        didSet {
            setupUI()
        }
    }
    
    @IBInspectable var percent: CGFloat = 10 {
        didSet {
            percent /= 100
            setupUI()
        }
    }
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupUI()
    }
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupUI()
    }
    
    func setupUI() {
        setupLayers()
        self.layer.addSublayer(backgroundRing)
        self.layer.addSublayer(ring)
    }
    
    private func setupLayers() {
        let rect = CGRectInset(bounds, lineWidth / 2, lineWidth / 2)
        for layer in [self.ring,self.backgroundRing] {
            layer.transform = CATransform3DRotate(CATransform3DIdentity, CGFloat(-90 * M_PI / 180), 0.0, 0.0, 1.0);
            layer.path = UIBezierPath(ovalInRect: rect).CGPath
            layer.lineWidth = lineWidth
            layer.fillColor = UIColor.clearColor().CGColor
            layer.frame = self.layer.bounds
        }
        ring.strokeEnd = percent
        ring.strokeColor = ringColor.CGColor
        backgroundRing.strokeColor = bgRingColor.CGColor
    }
}