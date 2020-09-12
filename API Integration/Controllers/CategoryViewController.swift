//
//  CategoryViewController.swift
//  API Integration
//
//  Created by Rajnish on 05/09/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import UIKit
import CoreData
import Reachability
import SDWebImage

class CategoryViewController: BaseViewController {

    var category = [CategoryValue]()
    var catName = ""
    var delegate: CategorySelection?
    
    @IBOutlet var categoryTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        categoryTableView.delegate = self
        getCategory()
    }

    
    func getCategory() {
        
        ApiManager.shared.fetchCategory(urlString: APIConstants.CATEGORY_URL, success: { (model) in
            
            self.category = model.categories
            self.category.forEach({self.addCategoryToDatabase(category: $0)})
            self.categoryTableView.reloadData()
            
        }) { (error) in
            
            self.isInternetAvailable { (value) in
                if value {
                    debugPrint("Error", error?.localizedDescription ?? "")
                } else {
                    // Core Data - data populate.
                    debugPrint("Require Core Data Use")
                    print(self.category.count)
                    self.fetchCatDataFromDataBase()
                }
            }
            
        }
        
    }
    
    
    func addCategoryToDatabase(category: CategoryValue) {
        
        // Check if duplicate exists for this product in database.
        // If so, do not add this product to database
        if checkForDuplicateInDataBase(categoryValue: category) {return}
        
        guard let managedObjectContext = DataBaseManager.manager.getContext() else {return}
        
        /* Find the entity you are trying to insert object in */
        
        guard let categoryEntity = NSEntityDescription.entity(forEntityName: "Category", in: managedObjectContext) else {return}
        
        /* Insert Data into Product Entity */
        let managedCategory = NSManagedObject(entity: categoryEntity, insertInto: managedObjectContext)
        
        managedCategory.setValue(category.id, forKey: "id")
        managedCategory.setValue(category.name, forKey: "name")
    
        
        // You have now inserted data into your database, but your context has not been saved.
        
        do {
            try managedObjectContext.save()
        } catch let error {
            print("Error: ", error.localizedDescription)
        }
        
    }
    
    func fetchCatDataFromDataBase() {
        
        guard let category = DataBaseManager.manager.fetchCategoryData(entityName: "Category") else {return}
        
        category.forEach { (category) in
            
            guard
                let id = category.value(forKey: "id") as? Int,
                let name = category.value(forKey: "name") as? String
                
                
                else {return}
            
            let viewCategory = CategoryValue(id: id, name: name, image: "")
            self.category.append(viewCategory)
            
        }
        
    }

}

extension CategoryViewController {
    
    func checkForDuplicateInDataBase(categoryValue: CategoryValue) -> Bool {
        
        guard let category = DataBaseManager.manager.fetchCategoryData(entityName: "Category") else {return false}
        
        return category.contains { (dbCategory) -> Bool in
            guard let id = dbCategory.value(forKey: "id") as? String else {return false}
            return id == "\(categoryValue.id)"
        }
    }
    
}

extension CategoryViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return category.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "categoryCell", for: indexPath) as! CategoryCell
        let url = category[indexPath.row].image
        cell.categoryName.text = category[indexPath.row].name
        cell.categoryImage.sd_setImage(with: URL(string: url), completed: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        categoryTableView.deselectRow(at: indexPath, animated: true)
        
        let cat = category[indexPath.row]
    

        dismiss(animated: true) {
            self.delegate?.didSelectCategory(categoryName: cat.name)
        }
                
    }
    
   

}
