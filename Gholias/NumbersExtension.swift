//
//  NumberFormat.swift
//  SGPmobile
//
//  Created by Felipe Oliveira on 1/15/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

import Foundation

public extension Int {
    func format(f: String) -> String {
        return NSString(format: "%\(f)d", self)
    }
}

public extension Double {
    func format(f: String) -> String {
        return NSString(format: "%\(f)f", self)
    }

    func toMoneyString() -> String {
        let numberFormatter = NSNumberFormatter()
        numberFormatter.numberStyle = NSNumberFormatterStyle.CurrencyStyle
        //        numberFormatter.locale = NSLocale(localeIdentifier: "pt_BR")
        numberFormatter.maximumFractionDigits = 2
        numberFormatter.minimumFractionDigits = 2
        return numberFormatter.stringFromNumber(self)!
    }
}