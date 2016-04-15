//
//  TableViewController.swift
//  Project12-Add New Item
//
//  Created by 朱立焜 on 16/4/14.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Create a Model to interact with View Controllers
// - Add data to the Model
// - Update the Table View when the View loads
// - Dismiss the view from the keyboard Done key
// - Segue to new Views from a Button

import UIKit

class TableViewController: UITableViewController {
    
    var dataSource = NSMutableArray(capacity: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = ["Iron Man", "Ratatouille", "The Matrix", "Office Space", "Shaolin Soccer"]
        
        self.clearsSelectionOnViewWillAppear = false
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func myClosure(string: String) -> Void {
        dataSource.addObject(string)
        tableView.reloadData()
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        
        if segue.identifier == "identifier" {
            let edit = segue.destinationViewController as! EditViewController
            edit.closure = myClosure
        }
        
    }
    
    // MARK: - Table view data source
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)

        cell.textLabel?.text = dataSource[indexPath.row] as? String

        return cell
    }
    
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
    
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

}
