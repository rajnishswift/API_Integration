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

class ProductsViewController: UIViewController {
    
    var products: ProductModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        getProducts()
        
    }
    
    func getProducts() {
        
        ApiManager.shared.fetchProducts(urlString: APIConstants.PRODUCTS_URL, success: { (model) in
            
            debugPrint(model)
            
        }) { (error) in
            
            if let failureError = error {
                debugPrint(failureError.localizedDescription)
            } else {
                //
            }
            
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
