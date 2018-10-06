//
//  Cell.swift
//  LinhKa_MVC_v3
//
//  Created by macbook on 10/5/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class Cell: UITableViewCell {
    
    var captionLabel : UILabel!
    var imageViewCell : UIImageView!
    var kCellWidth : CGFloat = 400
    var kCellHeight : CGFloat = 200
    var kLabelHeight : CGFloat = 50
    
    // Add objects to this cell.
    func addSubviews() -> Void {
        
        // Check if the image view is empty.
        if imageViewCell == nil {
            
            // Create an UIImageView by a frame
            imageViewCell = UIImageView(frame: CGRect(x: 0, y: 0, width: kCellWidth, height: kCellHeight))
            
            // ScaleApsectFill
            imageViewCell.contentMode = .ScaleAspectFill
            
            // Add the ImageView to the Cell
            contentView.addSubview(imageViewCell)
            
        }
        
        // Check if the name label is empty.
        if captionLabel == nil {
            
            // Create a label with a frame.
            captionLabel = UILabel(frame: CGRect(x: 30, y: 0, width: kCellWidth, height: kCellHeight))
            
            // Set attributes
            captionLabel.textAlignment = .Left
            captionLabel.textColor = UIColor.whiteColor()
            captionLabel.font = UIFont.boldSystemFontOfSize(16)
            
            // Add the label to the Cell
            contentView.addSubview(captionLabel)
            
        }
        
    }
    
}
