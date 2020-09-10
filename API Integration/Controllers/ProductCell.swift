//
//  ProductCell.swift
//  API Integration
//
//  Created by Rajnish on 05/09/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import UIKit

class ProductCell: UITableViewCell {

    @IBOutlet var productsLabel: UILabel!
    @IBOutlet var productImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
