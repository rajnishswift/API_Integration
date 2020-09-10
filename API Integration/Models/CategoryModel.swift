//
//  CategoryModel.swift
//  API Integration
//
//  Created by Rajnish on 20/08/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation

struct CategoryModel: Decodable {
    var categories: [CategoryValue]
}

struct CategoryValue: Decodable {
    var id: Int
    var name: String
    var image: String
}
