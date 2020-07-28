//
//  NetworkManager.swift
//  API Integration
//
//  Created by Akshansh Thakur on 28/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation
import Alamofire

// This is the networking layer of your app.

class NetworkManager {
    
    static let global = NetworkManager()
    
    func globalGetRequest(urlString: String, success: @escaping (Data?) -> (), failure: @escaping (Error?) -> ()) {
        
        guard let url = URL(string: urlString) else {
            // Throw error or add custom functionality
            return
        }
        
        Alamofire.request(url, method: .get, parameters: nil, encoding: JSONEncoding.default, headers: nil).responseJSON { (response) in
            
            if response.result.isSuccess {
                success(response.data)
            } else {
                failure(response.error)
            }
        }
    }
    
}
