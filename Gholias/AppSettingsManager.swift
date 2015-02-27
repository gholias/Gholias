//
//  AppSettings.swift
//  Gholias
//
//  Created by Felipe Oliveira on 2/21/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

public class AppSettingsManager {
    
    //MARK: - Singleton
    public class var sharedInstance : AppSettingsManager {
        struct Static {
            static let instance : AppSettingsManager = AppSettingsManager()
        }
        return Static.instance
    }
    
    public func getDefaultValue(key:String) -> AnyObject? {
        var myDict: NSDictionary?
        if let path = NSBundle.mainBundle().pathForResource("AppSettingsDefault", ofType: "plist") {
            myDict = NSDictionary(contentsOfFile: path)
        }
        if let dict = myDict {
            return dict[key]
        } else {
            return nil
        }
    }
    
    public func getObject(key:String) -> AnyObject? {
        let object:AnyObject? =  NSUserDefaults.standardUserDefaults().objectForKey(key)
        if object != nil {
            return object
        } else {
            //try to get from default values
            return self.getDefaultValue(key)
        }
    }
    
    public func getInt(key:String) -> Int? {
        return self.getObject(key) as? Int
    }
    
    public func getBool(key:String) -> Bool? {
        return self.getObject(key) as? Bool
    }
    
    public func getDate(key:String) -> NSDate? {
        return self.getObject(key) as? NSDate
    }
    
    public func setObject(object:AnyObject, key:String) {
        NSUserDefaults.standardUserDefaults().setObject(object, forKey: key)
        NSUserDefaults.standardUserDefaults().synchronize()
    }
}