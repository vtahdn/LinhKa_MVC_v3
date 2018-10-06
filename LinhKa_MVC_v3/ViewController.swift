//
//  ViewController.swift
//  LinhKa_MVC_v3
//
//  Created by macbook on 10/5/18.
//  Copyright © 2018 Viet. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    
    // Create a data variable
    var dataManager = DataManager.sharedInstance
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // For implement classes
        myTableView.delegate = self
        myTableView.dataSource = self
        
        // Edit the back button
        let backButton = UIBarButtonItem()
        backButton.title = "Linh Ka Team"
        navigationItem.backBarButtonItem = backButton
        
        // Change the arrow color
        navigationController?.navigationBar.tintColor = UIColor.whiteColor()
        
        // Title text color for NavigationBar
        UINavigationBar.appearance().titleTextAttributes = [NSForegroundColorAttributeName: UIColor.whiteColor(), NSFontAttributeName: UIFont.boldSystemFontOfSize(25)]
        
    }
    
    // The number of cells in the table
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataManager.data.count
    }
    
    // Data For Cell
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        
        // Create a cell at the index path
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! Cell
        
        // Create a variable to save data at the index path.
        let data = dataManager.data[indexPath.item] as! Profile
        
        // Add data to the cell
        cell.kCellWidth = self.view.frame.size.width
        cell.addSubviews()
        cell.imageViewCell.image = data.photo
        cell.captionLabel.text = data.caption
        
        return cell
        
    }
    
    // Height For Cell
    func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        return 150
        
    }
    
    // Function to delete cells
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        // Check if the command is "delete"
        if editingStyle == UITableViewCellEditingStyle.Delete {
            
            // Remove data at the index path.
            dataManager.data.removeObjectAtIndex(indexPath.item)
            
            // Remove cell at the index path.
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.Automatic)
            
        }
        
    }
    
//    // Move to DetailViewController
//    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
//        
//        // Segue
//        performSegueWithIdentifier("DetailSegue", sender: self)
//        
//    }
//    
    // Data for Moving
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        // Locate the DetailViewController
        if let destination = segue.destinationViewController as? DetailViewController {
            
            // Create a variable to save data at a selected rows.
            let profile = dataManager.data[(myTableView.indexPathForSelectedRow?.row)!] as! Profile
            
            // Add data
            destination.profile = profile
            
        }
    }


    
    
    
    
    
    
    
}

