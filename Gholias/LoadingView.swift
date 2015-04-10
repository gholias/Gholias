//
//  LoadingView.swift
//  Gholias
//
//  Created by Felipe Oliveira on 2/25/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//
import UIKit

public class LoadingView: UIView {
    
    @IBOutlet  var loadingImage: UIImageView!
    
    
    required public init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        setupLoading()
    }
    
    
    override public init(frame: CGRect) {
        super.init(frame: frame)
        setupLoading()
    }
    
    override public func layoutSubviews() {
        super.layoutSubviews()
    }
    
    func setupLoading() {
        
        self.loadingImage = UIImageView(frame: CGRectZero)
        self.loadingImage.frame.size.width = 40
        self.loadingImage.frame.size.height = 40
        self.loadingImage.setTranslatesAutoresizingMaskIntoConstraints(false)
        self.addSubview(self.loadingImage)
        
        
        let xCenterConstraint = NSLayoutConstraint(item: self.loadingImage, attribute: .CenterX, relatedBy: .Equal, toItem: self, attribute: .CenterX, multiplier: 1, constant: 0)
        self.addConstraint(xCenterConstraint)
    
        let yCenterConstraint = NSLayoutConstraint(item: self.loadingImage, attribute: .CenterY, relatedBy: .Equal, toItem: self, attribute: .CenterY, multiplier: 1, constant: 0)
        self.addConstraint(yCenterConstraint)
        
        var imagesArray:[UIImage] = []
        
        for i in 0..<35 {
          let image = UIImage(named: NSString(format: "loading_%d", i) as String, inBundle: NSBundle(forClass: Gholias.LoadingView), compatibleWithTraitCollection: nil)
            imagesArray.insert(image!.imageWithColor(self.tintColor), atIndex: 0)
        }
        
       // self.loadingImage.tintColor = UIColor.redColor()
        
//        NSLog("imagesArray \(imagesArray)")
        
        self.loadingImage!.animationImages = imagesArray
        self.loadingImage!.animationDuration = 2.0
        
    }
    
    public func hide() {
        self.hidden = true
        self.loadingImage!.stopAnimating()
    }
    
    public func show() {
        self.hidden = false
        self.loadingImage!.startAnimating()
    }
}

