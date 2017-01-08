//
//  TodoFetchResultController.swift
//  TodoList
//
//  Created by John Roque deLeon Jorillo on 09/01/2017.
//  Copyright © 2017 John Roque deLeon Jorillo. All rights reserved.
//

import Foundation
import CoreData
import UIKit

class TodoFetchResultsController: NSFetchedResultsController<NSFetchRequestResult>, NSFetchedResultsControllerDelegate {
     private let tableView: UITableView
    
    init(managedObjectContext: NSManagedObjectContext, withTableView tableView: UITableView) {
        self.tableView = tableView
        super.init(fetchRequest: Item.fetchRequestItem as! NSFetchRequest<NSFetchRequestResult>, managedObjectContext: managedObjectContext, sectionNameKeyPath: nil, cacheName: nil)
        
        self.delegate = self
        
        tryFetch()
    }
    
    func tryFetch() {
        do {
            try performFetch()
        } catch let error as NSError {
            print("Unresolved error: \(error), \(error.userInfo)")
        }
    }
    
    func controllerDidChangeContent(_ controller: NSFetchedResultsController<NSFetchRequestResult>) {
        tableView.reloadData()
    }
}
