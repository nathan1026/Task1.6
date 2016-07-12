//
//  TableViewController.swift
//  Task 1.6(TableView)
//
//  Created by Nathan Bahl on 7/6/16.
//  Copyright © 2016 Nathan Bahl. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {
    
    var books = bookArray
    
    @IBAction func addRow(sender: AnyObject) {
        
        let newRow = "New Row"
        
        books.append(newRow)
        
        tableView.reloadData()
    }
   
 
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.allowsSelectionDuringEditing = true
        
       
       //Edit button
         self.navigationItem.rightBarButtonItem = self.editButtonItem()
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - Table view data source

 

    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
       
        return books.count
    }

    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("Cell", forIndexPath: indexPath)
        
        cell.textLabel?.text = books[indexPath.item]

        return cell

    }
    //Used to title each section
    override func tableView(tableView:UITableView, titleForHeaderInSection section: Int) -> String? {
        
        return "Book Titles"
    }
    
    override func tableView(tableView: UITableView, editingStyleForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCellEditingStyle {
        
            return .Delete
    }

    
    // Override to support editing the table view.
    override func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete {
            
            books.removeAtIndex(indexPath.row)
       
            // Delete the row from the data source
            tableView.deleteRowsAtIndexPaths([indexPath], withRowAnimation: .Fade)
            
        }
    }
    

    
      override func setEditing(editing: Bool, animated: Bool) {
        super.setEditing(editing, animated: animated)
        
        if editing {
            tableView.setEditing(true, animated: true)
        } else {
            tableView.setEditing(false, animated: true)
        
        }
        
    }
    
    // Funtion to move rows in table
    override func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let itemToMove = books[sourceIndexPath.row]
        books.removeAtIndex(sourceIndexPath.row)
        books.insert(itemToMove, atIndex: destinationIndexPath.row)
    }
    
   
}
