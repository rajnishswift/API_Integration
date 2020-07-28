//
//  ViewController.swift
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

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
    }


}

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
