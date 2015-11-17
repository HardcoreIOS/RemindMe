//
//  TableViewController.swift
//  RemindMe
//
//  Created by Abdurrahman on 9/22/15.
//  Copyright © 2015 Hafiz Developer. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var toDoItems: NSMutableArray = NSMutableArray();
    
    override func viewDidAppear(animated: Bool) {
        
        var userDefaults: NSUserDefaults = NSUserDefaults.standardUserDefaults()
        
        var itemListFromUserDefaults: NSMutableArray? = userDefaults.objectForKey("itemList") as? NSMutableArray
        
        if (itemListFromUserDefaults != nil) {
            toDoItems = itemListFromUserDefaults!
        }
        
        self.tableView.reloadData()
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem()
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return toDoItems.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath) as! UITableViewCell
        
        var toDoItem: NSDictionary = toDoItems.objectAtIndex(indexPath.row) as! NSDictionary
        
        cell.textLabel?.text = toDoItem.objectForKey("itemTitle") as? String
        
        return cell
    }
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the specified item to be editable.
    return true
    }
    */
    
    /*
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
    if editingStyle == .Delete {
    // Delete the row from the data source
    tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
    } else if editingStyle == .Insert {
    // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }
    }
    */
    
    /*
    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
    
    }
    */
    
    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
    // Return false if you do not want the item to be re-orderable.
    return true
    }
    */
    
    
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if (segue.identifier == "showDetail") {
            
            var selectedIndexPath: NSIndexPath = self.tableView.indexPathForSelectedRow!
            
            var detailViewController: DetailViewController = segue.destinationViewController as! DetailViewController
            
            detailViewController.toDoData = toDoItems.objectAtIndex(selectedIndexPath.row) as! NSDictionary
            
        }
        
    }
    
    
}
