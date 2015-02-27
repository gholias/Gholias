//
//  Macros.swift
//
//  Created by Felipe Oliveira on 9/16/14.
//  Copyright (c) 2014 Felipe Oliveira. All rights reserved.
//

import Foundation


// dLog and aLog macros to abbreviate NSLog.
// Use like this:
//
//   dLog("Log this!")
//

/*
Now, you must set the "DEBUG" symbol elsewhere, though. Set it in the "Swift Compiler - Custom Flags" section, "Other Swift Flags" line. You add the DEBUG symbol with the -D DEBUG entry.
*/


#if DEBUG
    func DLog(message: String, filename: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    NSLog("[\(filename.lastPathComponent):\(line)] \(function) - \(message)")
    }
    #else
    func DLog(message: String, filename: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    }
#endif
func ALog(message: String, filename: String = __FILE__, function: String = __FUNCTION__, line: Int = __LINE__) {
    NSLog("[\(filename.lastPathComponent):\(line)] \(function) - \(message)")
}