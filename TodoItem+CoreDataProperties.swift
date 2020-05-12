//
//  TodoItem+CoreDataProperties.swift
//  ToDo
//
//  Created by MACBOOK on 13/05/20.
//  Copyright © 2020 SukhmaniKaur. All rights reserved.
//
//

import Foundation
import CoreData


extension TodoItem {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<TodoItem> {
        return NSFetchRequest<TodoItem>(entityName: "Todo_Item")
    }

    @NSManaged public var title: String?
    @NSManaged public var count: Int16

}
