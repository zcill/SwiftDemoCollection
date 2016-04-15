//
//  TableViewController.swift
//  project10- Pull To Refresh TableView
//
//  Created by 朱立焜 on 16/4/14.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Build a custom TableView Controller
// - Create custom Refresh Control
// - Stop refresh animation when data finished updating
// - Update the table with refreshed local data

import UIKit

class TableViewController: UITableViewController {

    var dataSource = NSMutableArray(capacity: 0)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSource = ["Milk", "Apple", "Eggs", "Ham"]
        
        self.refreshControl = UIRefreshControl(frame: CGRectMake(0, 0, 30, 30))
        self.refreshControl?.addTarget(self, action: #selector(refreshing), forControlEvents: .ValueChanged)
        
        self.navigationItem.leftBarButtonItem = self.editButtonItem()
    }
    
    func refreshing() {
        let tmpArray = ["Bread", "Fish", "Water", "Carrots"]
        dataSource.addObjectsFromArray(tmpArray)
        tableView.reloadData()
        self.refreshControl?.endRefreshing()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func addDataToDataSource(sender: UIBarButtonItem) {
        
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

    // Override to support conditional editing of the table view.
    override func tableView(tableView: UITableView, canEditRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }

    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
        } else if editingStyle == .Insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }

    // Override to support rearranging the table view.
    override func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {

    }
     
    // Override to support conditional rearranging of the table view.
    override func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }

}
