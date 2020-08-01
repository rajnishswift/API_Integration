//
//  BaseViewController.swift
//  API Integration
//
//  Created by Akshansh Thakur on 01/08/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import UIKit
import Reachability

class BaseViewController: UIViewController {
    
    let reachability = try! Reachability()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    func isInternetAvailable(reachable: @escaping (Bool) -> ()) {
        self.reachability.whenReachable = { reachability in
            reachable(true)
        }
        self.reachability.whenUnreachable = { _ in
            reachable(false)
        }
        
        do {
            try self.reachability.startNotifier()
        } catch {
            print("Unable to start notifier")
        }
    }
    
}
