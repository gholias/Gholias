//
//  Arrat.swift
//  SGPmobile
//
//  Created by Felipe Oliveira on 1/20/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

import Foundation
extension Array {
    func contains<T where T : Equatable>(obj: T) -> Bool {
        return self.filter({$0 as? T == obj}).count > 0
    }
    
    /** split in chunks with given chunk size */
    internal func chunks(chunksize:Int) -> [Array<T>] {
        var words:[[T]] = [[T]]()
        for var idx = chunksize; idx <= self.count; idx = idx + chunksize {
            let word = Array(self[idx - chunksize..<idx])
            words.append(word)
        }
        let reminder = Array(suffix(self, self.count % chunksize))
        if (reminder.count > 0) {
            words.append(reminder)
        }
        return words
    }
    
    /** split in chunks with given chunk size */
    internal func chunks2(chunksize:Float) -> [Array<T>] {
        var words:[[T]] = [[T]]()
        for var idx = chunksize; idx <= Float(self.count); idx = idx + chunksize {
            let word = Array(self[Int(idx - chunksize)..<Int(idx)])
            words.append(word)
        }
        let reminder = Array(suffix(self, self.count % Int(chunksize)))
        if (reminder.count > 0) {
            words.append(reminder)
        }
        return words
    }
    
    mutating func removeObject<U: Equatable>(object: U) {
        var index: Int?
        for (idx, objectToCompare) in enumerate(self) {
            if let to = objectToCompare as? U {
                if object == to {
                    index = idx
                }
            }
        }
        
        if((index) != nil) {
            self.removeAtIndex(index!)
        }
    }

    
}