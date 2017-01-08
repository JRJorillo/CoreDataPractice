//
//  Item+CoreDataClass.swift
//  TodoList
//
//  Created by John Roque deLeon Jorillo on 08/01/2017.
//  Copyright © 2017 John Roque deLeon Jorillo. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData

@objc(Item)
public class Item: NSManagedObject {
    
    static let identifier = "Item"
    
    static let fetchRequestItem: NSFetchRequest<Item> = {
        let request: NSFetchRequest<Item> = Item.fetchRequest()
        let sortDescriptor = NSSortDescriptor(key: "text", ascending: true)
        
        request.sortDescriptors = [sortDescriptor]
        
        return request
    }()
    
}
