//
//  NSDateExtension.swift
//  IGEV
//
//  Created by Felipe Oliveira on 1/8/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

public extension NSDate {
    func yearsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitYear, fromDate: date, toDate: self, options: nil).year
    }
    func monthsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMonth, fromDate: date, toDate: self, options: nil).month
    }
    func weeksFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitWeekOfYear, fromDate: date, toDate: self, options: nil).weekOfYear
    }
    func daysFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitDay, fromDate: date, toDate: self, options: nil).day
    }
    func hoursFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitHour, fromDate: date, toDate: self, options: nil).hour
    }
    func minutesFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitMinute, fromDate: date, toDate: self, options: nil).minute
    }
    func secondsFrom(date:NSDate) -> Int{
        return NSCalendar.currentCalendar().components(NSCalendarUnit.CalendarUnitSecond, fromDate: date, toDate: self, options: nil).second
    }
    public func offsetFrom(date:NSDate) -> String {
        if self.yearsFrom(date)   > 0 { return "\(self.yearsFrom(date))A"   }
        if self.monthsFrom(date)  > 0 { return "\(self.monthsFrom(date))M"  }
        if self.daysFrom(date)    > 0 { return "\(self.daysFrom(date))d"    }
        if self.hoursFrom(date)   > 0 { return "\(self.hoursFrom(date))h"   }
        if self.minutesFrom(date) > 0 { return "\(self.minutesFrom(date))m" }
        if self.secondsFrom(date) > 0 { return "\(self.secondsFrom(date))s" }
        return "0s"
    }
    
   
    
    func dateForNextWeekday(weekday:Int) -> NSDate {
        let today = NSDate()
        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        
        let weekdayComponents = gregorian?.components(NSCalendarUnit.CalendarUnitWeekday, fromDate: today)
        let componentsToSubtract = NSDateComponents()
        
        var dif = weekday - weekdayComponents!.weekday
        if dif < 0 {
            dif = dif + 7
        }
        componentsToSubtract.day = dif
        
        let beginningOfWeek = gregorian?.dateByAddingComponents(componentsToSubtract, toDate: today, options: NSCalendarOptions.WrapComponents)
        
        return beginningOfWeek!
    }
    
    func setHour(hour:Int) -> NSDate {

        let gregorian = NSCalendar(calendarIdentifier: NSCalendarIdentifierGregorian)
        let timeComps = NSCalendarUnit.CalendarUnitEra | NSCalendarUnit.CalendarUnitYear | NSCalendarUnit.CalendarUnitMonth | NSCalendarUnit.CalendarUnitDay | NSCalendarUnit.CalendarUnitHour | NSCalendarUnit.CalendarUnitMinute | NSCalendarUnit.CalendarUnitSecond | NSCalendarUnit.CalendarUnitWeekday | NSCalendarUnit.CalendarUnitTimeZone

        let components = gregorian?.components(timeComps, fromDate: self)

        components?.hour = hour
        components?.minute = 0
        
        return gregorian!.dateFromComponents(components!)!

    }
    
    public func toString(format:String) -> String {
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = format
        //dateFormatter.locale = NSLocale(localeIdentifier: "pt-br")
        return dateFormatter.stringFromDate(self)
    }

    public func toString() -> String {
        return self.toString("dd/MM/yyy")
    }
    
    
    
}
