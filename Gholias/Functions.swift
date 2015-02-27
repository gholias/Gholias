//
//  functions.swift
//  SGPmobile
//
//  Created by Felipe Oliveira on 1/20/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

import Foundation


public let log = XCGLogger.defaultInstance()
public func setupXCGLogger(logLevel: XCGLogger.LogLevel) {
    let urls = NSFileManager.defaultManager().URLsForDirectory(.CachesDirectory, inDomains: .UserDomainMask)
    var cacheDirectory:NSURL = urls[urls.endIndex-1] as NSURL
    
    // Setup XCGLogger
    let logPath : NSURL = cacheDirectory.URLByAppendingPathComponent("XCGLogger_Log.txt")
    log.setup(logLevel: logLevel, showLogLevel: true, showFileNames: true, showLineNumbers: true, writeToFile: logPath)

}

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

func addDashedLineWithColor(color: UIColor, frame:CGRect, lineWidth: CGFloat) -> CAShapeLayer {
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

