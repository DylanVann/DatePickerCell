//
//  ViewController.swift
//  SegFault11
//
//  Created by Dylan Vann on 2014-10-25.
//  Copyright (c) 2014 Dylan Vann. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    var cells:NSArray = []
    
    override func viewDidLoad() {
        
        self.tableView.rowHeight = UITableViewAutomaticDimension
        self.tableView.estimatedRowHeight = 44
        
        // Cells is a 2D array containing sections and rows.
        cells = [[DVDatePickerTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: nil)]]
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(5 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            self.tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.None)
            self.tableView(self.tableView, didSelectRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        })
        
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, Int64(6 * Double(NSEC_PER_SEC))), dispatch_get_main_queue(), {
            self.tableView.selectRowAtIndexPath(NSIndexPath(forRow: 0, inSection: 0), animated: true, scrollPosition: UITableViewScrollPosition.None)
            self.tableView(self.tableView, didSelectRowAtIndexPath: NSIndexPath(forRow: 0, inSection: 0))
        })
    }
    
    override func tableView(tableView: UITableView, heightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat {
        
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if (cell.isKindOfClass(DVDatePickerTableViewCell)) {
            return (cell as DVDatePickerTableViewCell).datePickerHeight()
        }
        
        return super.tableView(tableView, heightForRowAtIndexPath: indexPath)
    }
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return cells.count
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cells[section].count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return cells[indexPath.section][indexPath.row] as UITableViewCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        
        var cell = self.tableView(tableView, cellForRowAtIndexPath: indexPath)
        if (cell.isKindOfClass(DVDatePickerTableViewCell)) {
            var datePickerTableViewCell = cell as DVDatePickerTableViewCell
            datePickerTableViewCell.selectedInTableView(tableView)
        }
        
        self.tableView.deselectRowAtIndexPath(indexPath, animated: true)
    }
}

