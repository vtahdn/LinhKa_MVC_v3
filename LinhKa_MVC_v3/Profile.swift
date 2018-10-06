//
//  Profile.swift
//  LinhKa_MVC_v3
//
//  Created by macbook on 10/5/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

// Class to keep data
class Profile {
    
    var caption: String?
    var photo: UIImage?
    
    init(caption: String, photo: String) {
        
        self.caption = caption
        self.photo = UIImage(named: "\(photo).jpg")
        
    }
}
