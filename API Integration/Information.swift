//
//  Information.swift
//  API Integration
//
//  Created by Akshansh Thakur on 30/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation

/*
 What is a model
 
 My model is Person
 
 What information does it store? It stores age
 
 A class is an abstract type. It means it does not occupy any memory.
 
 An object is not an abstract type. It occupies space in memory.
 It is of a class type
 
*/

class Animal {
    var name: String!
    var color: String!
}

struct Person {
    var age: Int
}


class Implementation {
    
    func setup() {
        let tiger = Animal()
        tiger.name = "Tony"
        tiger.color = "Red"
        
        let cat = Animal()
        cat.name = "Kitty"
        cat.color = "Yellow"
        
        let _ = [tiger, cat]
    }
    
}
