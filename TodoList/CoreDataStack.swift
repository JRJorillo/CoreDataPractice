//
//  CoreDataStack.swift
//  TodoList
//
//  Created by John Roque deLeon Jorillo on 08/01/2017.
//  Copyright © 2017 John Roque deLeon Jorillo. All rights reserved.
//

import Foundation
import CoreData

class DataController: NSObject {
    
    static let sharedInstance = DataController()
    
    private override init() {}
    
    // Applications default directory address
    private lazy var applicationDocumentsDirectory: URL = {
        let urls = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return urls[urls.count - 1]
    }()
    
    private lazy var manageObjectModel: NSManagedObjectModel = {
        let modelURL = Bundle.main.url(forResource: "TodoList", withExtension: "momd")!
        return NSManagedObjectModel(contentsOf: modelURL)!
    }()
    
    private lazy var persistentStoreCoordinator: NSPersistentStoreCoordinator = {
        let coordinator = NSPersistentStoreCoordinator(managedObjectModel: self.manageObjectModel)
        let url = self.applicationDocumentsDirectory.appendingPathComponent("TodoList.sqlite")
        
        do {
            // If your looking for any kind of migration then here is the time to pass it to the options
            
            try coordinator.addPersistentStore(ofType: NSSQLiteStoreType, configurationName: nil, at: url, options: nil)
        } catch {
            let userInfo: [String: AnyObject] = [
                NSLocalizedDescriptionKey: "Failed to initialize the appilication's saved data" as AnyObject,
                NSLocalizedFailureReasonErrorKey: "There was an error creating or loading the application's saved data" as AnyObject,
                NSUnderlyingErrorKey: error as NSError
            ]
            
            let wrappedError = NSError(domain: "com.johnroque.CDError", code: 9999, userInfo: userInfo)
            print("Unresolved error \(wrappedError), \(wrappedError.userInfo)")
            abort()
        }
        
        return coordinator
    }()
    
    public lazy var managedObjectContext: NSManagedObjectContext = {
        // Returns the managed object context for the application (which is already bound to the persistent store coordinator for the application.) This property is optional since there are legitimate error conditions that could cause the creation of the context to fail.
        
        let coordinator = self.persistentStoreCoordinator
        let manageObjectContext = NSManagedObjectContext(concurrencyType: .mainQueueConcurrencyType)
        
        manageObjectContext.persistentStoreCoordinator = coordinator
        
        return manageObjectContext
    }()
    
    
    public func saveContext() {
        if managedObjectContext.hasChanges {
            do {
                try managedObjectContext.save()
            } catch let error as NSError {
                fatalError("Unresolved error \(error), \(error.userInfo)")
            }
        }
    }
    
}
