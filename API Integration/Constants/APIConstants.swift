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
    
    static let PRODUCTS_URL = API_BASE_URL + "getProducts/Spanners"
    
    static let CATEGORY_URL = API_BASE_URL + "category"
}
