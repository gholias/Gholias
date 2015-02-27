//
//  APIManager.swift
//  Gholias
//
//  Created by Felipe Oliveira on 2/22/15.
//  Copyright (c) 2015 Felipe Oliveira. All rights reserved.
//

import Foundation

class APIManager {
    
    //MARK: - Singleton
    class var sharedInstance : APIManager {
        struct Static {
            static let instance : APIManager = APIManager()
        }
        return Static.instance
    }
    
    /*
    func getGerencias(completion: (results:[PFObject]?, error:NSError?) -> Void) {
        
        var returnObjects:[PFObject]?
        let query:PFQuery = PFQuery(className: "Gerencia")
        
        if Network.hasConnectivity() {
            NSLog("📡 - Connected to the internet")
            //Get data from parse
            query.findObjectsInBackgroundWithBlock({ (results:[AnyObject]!, error:NSError!) -> Void in
                if error != nil {
                    NSLog("💀 - Error loading gerencia from Parse %@", error.description)
                } else {
                    PFObject.unpinAllObjectsInBackgroundWithName("Gerencia", block: { (success: Bool, unpinError: NSError!) -> Void in
                        if unpinError != nil {
                            NSLog("💀 - Error unpining gerencia in localstore %@", unpinError.description)
                        }
                        PFObject.pinAllInBackground(results, withName: "Gerencia", block: { (sucess:Bool, pinError: NSError!) -> Void in
                            if pinError != nil {
                                NSLog("💀 - Error pining gerencia in localstore %@", unpinError.description)
                            }
                        })
                    })
                    if AppSettingsManager.sharedInstance.currentGerenciaId == "" {
                        if let firstGerencia = results.first as? PFObject {
                            AppSettingsManager.sharedInstance.currentGerenciaId = firstGerencia.objectId
                        }
                    }
                    completion(results: results as? [PFObject], error: error)
                }
            })
        } else {
            //Try to get from localdatastore
            NSLog("🈵 - Offline mode, not connected to the internet")
            query.fromLocalDatastore()
            query.findObjectsInBackgroundWithBlock({ (results:[AnyObject]!, error:NSError!) -> Void in
                if error != nil {
                    NSLog("Error loading gerencia from Local DataStore %@", error.description)
                } else {
                    completion(results: results as? [PFObject], error: error)
                }
            })
        }
    }
*/

}
