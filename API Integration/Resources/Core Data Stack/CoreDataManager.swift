//
//  CoreDataManager.swift
//  API Integration
//
//  Created by Akshansh Thakur on 01/08/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation
import CoreData
import UIKit

/// DataBase Singleton
class DataBaseManager {
    
    private init() {}
    
    static let manager = DataBaseManager()
    
    func getContext() -> NSManagedObjectContext? {
        // Find Delegate
        guard let applicationDelegate = (UIApplication.shared.delegate as? AppDelegate) else {
            return nil
        }
        
        /* Managed Object Context */
        return applicationDelegate.persistentContainer.viewContext
    }
    
    func fetchData(entityName: String) -> [NSManagedObject]? {
        
        let request = NSFetchRequest<NSManagedObject>(entityName: "Product")
        
        do {
            let fetchedProducts = try getContext()?.fetch(request)
            return fetchedProducts ?? nil
        } catch let error {
            print("Error: ", error.localizedDescription)
        }
        
        return nil
        
    }
    
}
