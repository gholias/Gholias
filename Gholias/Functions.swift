//
//  functions.swift
//  SGPmobile
//
//  Created by Felipe Oliveira on 1/20/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

import Foundation




func addDashedBorderWithColor(color: UIColor, frame:CGRect) -> CAShapeLayer {
    let shapeLayer:CAShapeLayer = CAShapeLayer()
    let shapeRect = CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)
    shapeLayer.bounds = shapeRect
    shapeLayer.position = CGPointMake((frame.size.width / 2), (frame.size.height / 2))
    
    shapeLayer.fillColor = UIColor.clearColor().CGColor
    shapeLayer.strokeColor = color.CGColor
    shapeLayer.lineWidth = 3.0
    shapeLayer.lineJoin = kCALineJoinRound
    shapeLayer.lineDashPattern = [10, 5]
    let path:UIBezierPath = UIBezierPath(roundedRect: shapeRect, cornerRadius: 5)
    shapeLayer.path = path.CGPath
    
    return shapeLayer
}

public func addDashedLineWithColor(color: UIColor, frame:CGRect, lineWidth: CGFloat) -> CAShapeLayer {
    let shapeLayer:CAShapeLayer = CAShapeLayer()
    let shapeRect = CGRectMake(0.0, 0.0, frame.size.width, frame.size.height)
    shapeLayer.bounds = shapeRect
    shapeLayer.position = CGPointMake((frame.size.width / 2), (frame.size.height / 2))
    
    shapeLayer.fillColor = UIColor.clearColor().CGColor
    shapeLayer.strokeColor = color.CGColor
    shapeLayer.lineWidth = lineWidth
    shapeLayer.lineJoin = kCALineJoinRound
    shapeLayer.lineDashPattern = [4, 2]
    
    
    let beginPoint = CGPointMake(0, 0)//frame.size.height / 2)
    let endPoint = CGPointMake(beginPoint.x + frame.size.width, beginPoint.y)
    let path = CGPathCreateMutable()
    CGPathMoveToPoint(path, nil, beginPoint.x, beginPoint.y)
    CGPathAddLineToPoint(path, nil, endPoint.x, endPoint.y)

    shapeLayer.path = path
    
    return shapeLayer
}

//MARK: - ios version
public func SYSTEM_VERSION_EQUAL_TO(version: NSString) -> Bool {
    return UIDevice.currentDevice().systemVersion.compare(version as String,
        options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedSame
}

public func SYSTEM_VERSION_GREATER_THAN(version: NSString) -> Bool {
    return UIDevice.currentDevice().systemVersion.compare(version as String,
        options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedDescending
}

public func SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(version: NSString) -> Bool {
    return UIDevice.currentDevice().systemVersion.compare(version as String,
        options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedAscending
}

public func SYSTEM_VERSION_LESS_THAN(version: NSString) -> Bool {
    return UIDevice.currentDevice().systemVersion.compare(version as String,
        options: NSStringCompareOptions.NumericSearch) == NSComparisonResult.OrderedAscending
}

public func SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(version: NSString) -> Bool {
    return UIDevice.currentDevice().systemVersion.compare(version as String,
        options: NSStringCompareOptions.NumericSearch) != NSComparisonResult.OrderedDescending
}

//MARK: - DrawerMenu
public func initDrawerController(#window: UIWindow, #storyboardName: String, #centerControllerIdentifier: String, #leftSideControllerIdentifier: String?, #rightSideControllerIdentifier: String?) -> DrawerController {
    
    
    let storyboard = UIStoryboard(name: storyboardName, bundle: nil);
    
    let centerController = storyboard.instantiateViewControllerWithIdentifier(centerControllerIdentifier) as! UIViewController;
    
    
    var leftSideController:UIViewController? = nil
    var rightSideController:UIViewController? = nil
    
    if leftSideControllerIdentifier != nil {
        leftSideController = storyboard.instantiateViewControllerWithIdentifier(leftSideControllerIdentifier!) as? UIViewController;
    }
    
    if rightSideControllerIdentifier != nil {
        rightSideController = storyboard.instantiateViewControllerWithIdentifier(rightSideControllerIdentifier!) as? UIViewController;
    }
    
    return initDrawerController(window: window, centerController: centerController, leftSideController: leftSideController, rightSideController: rightSideController)
}

public func initDrawerController(#window: UIWindow, #centerController: UIViewController, #leftSideController: UIViewController?, #rightSideController: UIViewController?) -> DrawerController {
    
    let drawerController = DrawerController(centerViewController: centerController, leftDrawerViewController: leftSideController, rightDrawerViewController: rightSideController)
    drawerController.showsShadows = false
    
    drawerController.restorationIdentifier = "Drawer"
    drawerController.maximumRightDrawerWidth = 200.0
    drawerController.openDrawerGestureModeMask = .All
    drawerController.closeDrawerGestureModeMask = .All
    
    window.rootViewController = drawerController
    
    return drawerController
    
}

