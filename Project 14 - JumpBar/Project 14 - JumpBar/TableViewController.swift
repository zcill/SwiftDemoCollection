//
//  TableViewController.swift
//  Project 14 - JumpBar
//
//  Created by 朱立焜 on 16/4/15.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Sort an Array in alphabetical order
// - Create an Indexed Table View

import UIKit

class TableViewController: UITableViewController {
    
    var dataDictionary = NSDictionary()
    var dataSource = NSArray()
    var sectionTitles = NSArray()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        dataDictionary = [
            "B" : ["Bear", "Black Swan", "Buffalo"],
            "C" : ["Camel", "Cockatoo"],
            "D" : ["Dog", "Donkey"],
            "E" : ["Emu"],
            "G" : ["Giraffe", "Greater Rhea"],
            "H" : ["Hippopotamus", "Horse"],
            "K" : ["Koala"],
            "L" : ["Lion", "Llama"],
            "M" : ["Manatus", "Meerkat"],
            "P" : ["Panda", "Peacock", "Pig", "Platypus", "Polar Bear"],
            "R" : ["Rhinoceros"],
            "S" : ["Seagull"],
            "T" : ["Tasmania Devil"],
            "W" : ["Whale", "Whale Shark", "Wombat"]
        ]
        
        sectionTitles = dataDictionary.allKeys.sort({ (element1, element2) -> Bool in
            return element2 as? String > element1 as? String
        })
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return sectionTitles.count
    }

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let value = sectionTitles[section]
        dataSource = dataDictionary.objectForKey(value) as! NSArray
        return dataSource.count
    }
    
    // sectionHeader's title
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles[section] as? String
    }
    
    // index titles
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return sectionTitles as? [String]
        
        // if you want add 'A'-'Z' into index titles, you can do this:
//        return ["A", "B", "C", ... , "Y", "Z"]
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        
        let value = sectionTitles[indexPath.section]
        dataSource = dataDictionary.objectForKey(value) as! NSArray
        cell.textLabel?.text = dataSource[indexPath.row] as? String
        
        return cell
    }

}
