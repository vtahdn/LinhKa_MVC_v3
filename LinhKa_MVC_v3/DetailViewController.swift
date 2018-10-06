//
//  DetailViewController.swift
//  LinhKa_MVC_v3
//
//  Created by macbook on 10/5/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var caption: UILabel!
    @IBOutlet weak var photo: UIImageView!
    
    var profile: Profile!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Add content
        caption.text = profile.caption
        photo.image = profile.photo
        
    }
}
