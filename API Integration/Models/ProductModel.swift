//
//  ProductModel.swift
//  API Integration
//
//  Created by Akshansh Thakur on 30/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation

struct ProductModel: Decodable {
    var products: [ProductValue]
}

struct ProductValue: Decodable {
    var id: String
    var image: String
    var name: String
}
