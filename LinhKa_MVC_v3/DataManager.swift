//
//  DataManager.swift
//  LinhKa_MVC_v3
//
//  Created by macbook on 10/5/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import Foundation
import UIKit

class DataManager {
    
    // Singleton
    var  data = NSMutableArray()
    
    class var sharedInstance: DataManager {
       
        struct Static {
            
            static var onceToken: dispatch_once_t = 0
            static var instance: DataManager? = nil
            
        }
        
        dispatch_once(&Static.onceToken) {
            
            Static.instance = DataManager()
            
            // Get data from the plist file.
            let filePath = NSBundle.mainBundle().pathForResource("LinhKa", ofType: "plist")
            
            // Add to a dictionary
            let raw = NSDictionary(contentsOfFile: filePath!)
            
            // Initial a temporaty array to keep data.
            let temp = NSMutableArray(capacity: raw!.count)
            
            // Convert data to Profile Class Objects and add them to the array
            for item in raw! {
                
                let profile = Profile(caption: item.value.valueForKey("caption") as! String, photo: item.value.valueForKey("photo") as! String)
                
                temp.addObject(profile)
                
            }
            
            // Save the array to the instance variable.
            Static.instance?.data = NSMutableArray(array: temp)
            
        }
        
        // Return the converted data.
        return Static.instance!
    }
    
    
    
    
    
    
    
    
    
    
}
