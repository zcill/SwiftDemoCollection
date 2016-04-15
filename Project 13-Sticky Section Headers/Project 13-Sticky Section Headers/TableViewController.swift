//
//  TableViewController.swift
//  Project 13-Sticky Section Headers
//
//  Created by 朱立焜 on 16/4/15.
//  Copyright © 2016年 朱立焜. All rights reserved.
//

// I learned how to:
// - Store and access data in a Dictioanry
// - Use a Dictionary to dynamically fill a table with text
// - Create Sticky Section Headers based off data in a Dictionary

import UIKit

class TableViewController: UITableViewController {
    
    var dataDictionary = NSDictionary()
    var dataSource = NSArray()
    var sectionTitles = NSArray()
    
    // 返回数据源数组
    func returnDataSource(section: Int) -> NSArray {
        let dicKey = sectionTitles[section] as? String
        dataSource = (dataDictionary.valueForKey(dicKey!)! as? NSArray)!
        return dataSource
    }
    
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
        
        sectionTitles = dataDictionary.allKeys.sort { (element1, element2) -> Bool in
            return element2 as? String > element1 as? String
        }
        
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
        dataSource = returnDataSource(section)
        return dataSource.count
    }

    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("cell", forIndexPath: indexPath)
        dataSource = returnDataSource(indexPath.section)
        cell.textLabel?.text = dataSource[indexPath.row] as? String
        
        return cell
    }
    
    override func tableView(tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionTitles.objectAtIndex(section) as? String
    }
    
    override func sectionIndexTitlesForTableView(tableView: UITableView) -> [String]? {
        return sectionTitles as? [String]
    }

}
