//
//  ProductsViewController.swift
//  API Integration
//
//  Created by Akshansh Thakur on 28/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

/*
 
 
 API is an interface through which Client communicates with a Server
 
 1. Server serves data through an API.
 2. App Receives this data in JSON format
 3. Application converts this JSON Data to Models in swift
 4. Then we populate our data from models in UI
 
*/

import UIKit
import CoreData
import Reachability
import SDWebImage

class ProductsViewController: BaseViewController {
    
    @IBOutlet var tableView: UITableView!

    
    var products = [ProductValue]()
    var category = [CategoryValue]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProducts()
      
        
       
    }
    
    func getProducts() {
        
        ApiManager.shared.fetchProducts(urlString: APIConstants.PRODUCTS_URL, success: { (model) in
            
            self.products = model.products
            self.products.forEach({self.addProductsToDatabase(product: $0)})
            self.tableView.reloadData()
            
        }) { (error) in
            
            self.isInternetAvailable { (value) in
                if value {
                    debugPrint("Error", error?.localizedDescription ?? "")
                } else {
                    // Core Data - data populate.
                    debugPrint("Require Core Data Use")
                    print(self.products.count)
                    self.fetchDataFromDataBase()
                    
                }
            }
            
        }
        
    }
    
    func addProductsToDatabase(product: ProductValue) {
        
        // Check if duplicate exists for this product in database.
        // If so, do not add this product to database
        if checkForDuplicateInDataBase(productValue: product) {return}
        
        guard let managedObjectContext = DataBaseManager.manager.getContext() else {return}
        
        /* Find the entity you are trying to insert object in */
        
        guard let productEntity = NSEntityDescription.entity(forEntityName: "Product", in: managedObjectContext) else {return}
        
        /* Insert Data into Product Entity */
        let managedProduct = NSManagedObject(entity: productEntity, insertInto: managedObjectContext)
        
        managedProduct.setValue(product.id, forKey: "id")
        managedProduct.setValue(product.name, forKey: "name")
        managedProduct.setValue(product.image, forKey: "image")
        
        // You have now inserted data into your database, but your context has not been saved.
        
        do {
            try managedObjectContext.save()
        } catch let error {
            print("Error: ", error.localizedDescription)
        }
        
    }
    
    
    func fetchDataFromDataBase() {
        
        guard let products = DataBaseManager.manager.fetchData(entityName: "Product") else {return}
        
        products.forEach { (product) in
            
            guard
                let id = product.value(forKey: "id") as? String,
                let name = product.value(forKey: "name") as? String,
                let image = product.value(forKey: "image") as? String
                else {return}
            
            let viewProduct = ProductValue(id: id, image: image, name: name)
            self.products.append(viewProduct)
            
        }
        
    }
    
    
}


/* Core Data Helper Methods */
extension ProductsViewController {
    
    func checkForDuplicateInDataBase(productValue: ProductValue) -> Bool {
        
        guard let products = DataBaseManager.manager.fetchData(entityName: "Product") else {return false}
        
        return products.contains { (dbProduct) -> Bool in
            guard let id = dbProduct.value(forKey: "id") as? String else {return false}
            return id == productValue.id
        }
    }
    
}





/*
 
 MVC   - Model View Controller
                |
                |
 MV-VM - Model View (View-Model)
 
 
 What is MVC?
 
 In MVC,
 
 MVC Components Definitions
    1. Model stores data.
    2. View is the visual presentation of data.
    3. Controller allows communication between Model and View.
 
 Components Relationships
    4. Model and View never communicate directly with each other.
    5. Controller can access Model.
    6. Model can never talk to Controller.
    7. Controller can keep outlet of a View. Or a controller can create Views using UIKit programmatically.
    8. View cannot talk to controller without Target Action Pattern (IBAction) or selector functions.
 
 MVC Related Features
    9. In MVC projects, Networking takes place inside Controller.
 
    Note*: Target Action is same as IBAction (Interface Builder Action). Only difference is that Target Action is used programmatically and is triggered through selector functions.
 
 */

extension ProductsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! ProductCell
        
        let url = products[indexPath.row].image
        cell.productsLabel.text = products[indexPath.row].name
        cell.productImage.sd_setImage(with: URL(string: url), completed: nil)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 50
    }
    
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        
        let button = UIButton()
        button.setTitle("Get Category", for: .normal)
        button.backgroundColor = .blue
        button.layer.cornerRadius = 8
        button.setTitleColor(.white, for: .normal)
        
        button.addTarget(self, action: #selector(buttonClicked), for: .touchUpInside)
        
        return button
       
    }
    
    @objc func buttonClicked() {
        let category = storyboard?.instantiateViewController(withIdentifier: "CategoryViewController") as! CategoryViewController
        present(category, animated: true, completion: nil)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
}
