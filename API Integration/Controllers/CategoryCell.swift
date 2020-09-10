//
//  CategoryCell.swift
//  API Integration
//
//  Created by Rajnish on 05/09/20.
//  Copyright © 2020 Akshansh Thakur. All rights reserved.
//

import UIKit

class CategoryCell: UITableViewCell {
    
    
    @IBOutlet var categoryName: UILabel!
    @IBOutlet var categoryImage: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
