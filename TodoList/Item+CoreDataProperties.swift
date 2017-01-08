//
//  Item+CoreDataProperties.swift
//  TodoList
//
//  Created by John Roque deLeon Jorillo on 08/01/2017.
//  Copyright © 2017 John Roque deLeon Jorillo. All rights reserved.
//  This file was automatically generated and should not be edited.
//

import Foundation
import CoreData


extension Item {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Item> {
        return NSFetchRequest<Item>(entityName: "Item");
    }

    @NSManaged public var text: String?
    @NSManaged public var completed: Bool

}
