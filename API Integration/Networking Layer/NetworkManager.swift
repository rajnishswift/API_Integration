//
//  NetworkManager.swift
//  API Integration
//
//  Created by Akshansh Thakur on 28/07/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import Foundation
import Alamofire
import Reachability

typealias Header = [String: String]
typealias Parameter = [String: Any]
typealias TVDelegates = UITableViewDelegate & UITableViewDataSource
// This is the server side of networking Layer

class NetworkManager {
    
    static var shared: NetworkManager {
        
        let manager = NetworkManager()
        return manager
        
    }
    
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
    
    func globalPostRequest(urlString: String, params: Parameter, success: @escaping (Data?) -> (), failure: @escaping (Error?) -> ()) {
        
        var header = Header()
        header["TOKEN"] = ""
        
        guard let url = URL(string: urlString) else {
            // Throw error or add custom functionality
            return
        }
        
        Alamofire.request(url, method: .get, parameters: params, encoding: JSONEncoding.default, headers: header).responseJSON { (response) in
            
            if response.result.isSuccess {
                success(response.data)
            } else {
                failure(response.error)
            }
        }
    }
    
}

