//
//  String+Trim.swift
//
//  Created by Pedro Vieira on 08/06/14.
//  Copyright (c) 2014 Pedro Vieira ( http://pedrovieira.me/ ). All rights reserved.
//

import Foundation

public extension String {
    func trim() -> String {
        return self.stringByTrimmingCharactersInSet(.whitespaceAndNewlineCharacterSet())
    }
    
    var floatValue: Float {
        return (self as NSString).floatValue
    }
    
    func toDate() -> NSDate {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "dd/MM/yyy"
        return dateFormatter.dateFromString(self)!
    }
    
    func isValidEmail() -> Bool {
        let emailRegEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,4}"
        
        var emailTest = NSPredicate(format:"SELF MATCHES %@", emailRegEx)
        let result = emailTest.evaluateWithObject(self)
        return result
    }
    
    subscript (i: Int) -> String {
        if count(self) > i {
            return String(Array(self)[i])
        }
        return ""
    }
    
    func indexAt(theInt:Int)->String.Index {
        return advance(self.startIndex, theInt)
    }

}