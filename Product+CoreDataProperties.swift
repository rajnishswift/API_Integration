//
//  Product+CoreDataProperties.swift
//  
//
//  Created by Akshansh Thakur on 16/08/20.
//
//

import Foundation
import CoreData


extension Product {

    @nonobjc public class func fetchRequest() -> NSFetchRequest<Product> {
        return NSFetchRequest<Product>(entityName: "Product")
    }

    @NSManaged public var id: String?
    @NSManaged public var image: String?
    @NSManaged public var name: String?

}
