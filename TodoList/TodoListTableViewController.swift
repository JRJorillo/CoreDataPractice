//
//  TodoListTableViewController.swift
//  TodoList
//
//  Created by John Roque deLeon Jorillo on 08/01/2017.
//  Copyright © 2017 John Roque deLeon Jorillo. All rights reserved.
//

import UIKit
import CoreData

class TodoListTableViewController: UITableViewController, NSFetchedResultsControllerDelegate {
    
    let managedObjectContext = DataController.sharedInstance.managedObjectContext
    
    lazy var fetchedResultsController: TodoFetchResultsController = {
        let controller = TodoFetchResultsController(managedObjectContext: self.managedObjectContext, withTableView: self.tableView)
        
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // MARK: - Table view data source
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return self.fetchedResultsController.sections?.count ?? 0
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        
        guard let section = fetchedResultsController.sections?[section] else {
            return 0
        }
        
        return section.numberOfObjects
        
    }
    
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        //Configure the cell...
        
        return configureCell(cell: cell, atIndexPath: indexPath)
    }
    
    private func configureCell(cell: UITableViewCell, atIndexPath: IndexPath) -> UITableViewCell {
        let item = fetchedResultsController.object(at: atIndexPath) as! Item
        
        cell.textLabel?.text = item.text
        
        return cell
    }
    
}
