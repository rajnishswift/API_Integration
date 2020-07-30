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
    
    static let shared = ApiManager()
    
    func fetchProducts(urlString: String, success: @escaping (ProductModel) -> (), failure: @escaping (Error?) -> ()) {
        
        NetworkManager.shared.globalGetRequest(urlString: urlString, success: { (response) in
            
            guard let data = response else {
                return failure(nil)
            }
            
            do {
                let products = try JSONDecoder().decode(ProductModel.self, from: data)
                success(products)
            } catch let error {
                failure(error)
            }
            
        }) { (error) in
            failure(error)
        }
        
    }
    
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
