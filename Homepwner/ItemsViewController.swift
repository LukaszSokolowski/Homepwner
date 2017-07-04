//
//  ItemsViewController.swift
//  Homepwner
//
//  Created by Łukasz Sokołowski on 23/06/2017.
//  Copyright © 2017 Łukasz Sokołowski. All rights reserved.
//

import UIKit
class ItemsViewController: UITableViewController {
    var itemStore: ItemStore!
    
    @IBOutlet weak var editButton: UIButton!
    @IBOutlet weak var addButton: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 65
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        navigationItem.leftBarButtonItem = editButtonItem
    }
    
    @IBAction func addNewItem(_ sender: UIBarButtonItem) {
        
      // Create a new item and add to the store
        let newItem = itemStore.createItem()
      // Figure out where that file is in the array
        if let index = itemStore.allItems.index(of: newItem) {
            let indexPath = IndexPath(row: index, section: 0)
            // Insert this row into array
            tableView.insertRows(at: [indexPath], with: .automatic)
        }
    }
          // two required methods for table view
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return itemStore.allItems.count
    }
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        // Get a new or recycled cell
        let cell = tableView.dequeueReusableCell(withIdentifier: "ItemCell", for: indexPath) as! ItemCell
        // Set the text on the cell with the description of the item
        // that is at the nth index of items, where n = row this cell
        // will appear in on the tableview 
        let item = itemStore.allItems[indexPath.row]
            cell.nameLabel.text = item.name
            cell.valueLabel.text = "$\(item.valueInDollars)"
            cell.serialNumberLabel.text = item.serialNumber
        if item.valueInDollars >= 50 {
            cell.valueLabel.backgroundColor = UIColor.red
        } else {
            cell.valueLabel.backgroundColor = UIColor.green
        }
        return cell
    }
    
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        // If the table view is asking to commit a delete command
        if editingStyle == .delete {
            let item = itemStore.allItems[indexPath.row]
            
            let title = "Delete \(item.name)?"
            let message = "Are you sure you want to delete this item?"
            let ac = UIAlertController(title: title, message: message, preferredStyle: .actionSheet)
            
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            ac.addAction(cancelAction)
            
            let deleteAction = UIAlertAction(title: "Delete", style: .destructive, handler: { (action) -> Void in
            // Remove the item from the store
                self.itemStore.removeItem(item)
            // Also remove thet row from the table view with an animation
                self.tableView.deleteRows(at: [indexPath], with: .automatic) })
            
            ac.addAction(deleteAction)
            // Present the alert controller
            present(ac, animated: true, completion: nil)
        }
    }
    
    override func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
        // Update the model
        itemStore.moveItem(from: sourceIndexPath.row, to: destinationIndexPath.row)
    }
    override func tableView(_ tableView: UITableView, titleForDeleteConfirmationButtonForRowAt indexPath: IndexPath) -> String? {
        let tittleForDeleteButton = "Remove"
        return tittleForDeleteButton
    }
    override func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String? {
        let titleForFooter = "No more items!"
        return titleForFooter
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // If the triggered segue is the showItem segue
        switch segue.identifier {
        case "showItem"?:
            //Figure out which row was just tapped
            if let row = tableView.indexPathForSelectedRow?.row {
                // Get the item associated with this row and pass it along
                let item = itemStore.allItems[row]
                let detailViewController = segue.destination as! DetailViewController
                detailViewController.item = item
            }
        default:
            preconditionFailure("Unexpected segue identifier.")
        }
    }
}








