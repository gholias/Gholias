//
//  APIManager.swift
//  Gholias
//
//  Created by Felipe Oliveira on 2/22/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

import Foundation

public class APIManager {
    
    //MARK: - Singleton
    public class var sharedInstance : APIManager {
        struct Static {
            static let instance : APIManager = APIManager()
        }
        return Static.instance
    }
    
    public init() {
        
    }
}

public typealias API = APIManager