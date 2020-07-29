//
//  ApiManager.swift
//  API Integration
//
//  Created by Akshansh Thakur on 29/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation

// This is the app side of networking Layer
// Network Layer ->  Server Facing Layer + APP FACING LAYER

struct ApiManager {
    
    func fetchProducts(urlString: String, success: @escaping () -> (), failure: @escaping () -> ()) {
        
        NetworkManager.global.globalGetRequest(urlString: urlString, success: { (data) in
            // Process Data
            // After processing data return it in completionhandler
        }) { (error) in
            // Print error or show popup
        }
        
    }
    
}


// THIS IS OUR MODEL

struct ProductModel {
    var product: [Product]
}

struct Product {
    var id: Int
    var image: String
    var name: String
}


/***                        NEVER USE                        ***/
extension NetworkManager {
    
    func getProducts() {
        
        // NEVER HIT API from Network Manager Itself
        //
        //
        
    }
    
}

/***                        NEVER MAKE ALL MODELS TOGETHER                       ***/
struct GlobalModels {
    
    struct ProductModel {
        var product: [Product]
    }
    
    struct Product {
        var id: Int
        var image: String
        var name: String
    }
    
    
    struct CategoryModel {
        var category: [Category]
    }
    
    struct Category {
        var id: Int
        var image: String
        var name: String
    }
    
}
