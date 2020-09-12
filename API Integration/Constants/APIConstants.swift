//
//  APIConstants.swift
//  API Integration
//
//  Created by Akshansh Thakur on 28/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation

/*
 
 1. Base URL
 2. End URL
 3. Complete URL = Base URL + End URL
 http://deneershandtools.com:8080/category
 */

struct APIConstants {
    
    static let API_BASE_URL = "http://deneershandtools.com:8080/"
    static var PRODUCTS_URL = API_BASE_URL + "getProducts/"
    static let CATEGORY_URL = API_BASE_URL + "category"
    
}

enum EndPoint {
    
    case getProducts(String)
    case getCategories

}

extension EndPoint {
    
    var url: String {
        switch self {
        case .getCategories:
            return APIConstants.CATEGORY_URL
        case .getProducts(let categoryName):
            return APIConstants.PRODUCTS_URL + categoryName
        }
    }
    
}

