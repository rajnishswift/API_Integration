//
//  ProductModel.swift
//  API Integration
//
//  Created by Akshansh Thakur on 30/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation

struct ProductModel: Decodable {
    var product: [Product]
}

struct Product: Decodable {
    var id: Int
    var image: String
    var name: String
}
