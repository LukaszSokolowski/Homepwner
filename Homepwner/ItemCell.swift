//
//  ItemCell.swift
//  Homepwner
//
//  Created by Łukasz Sokołowski on 29/06/2017.
//  Copyright © 2017 Łukasz Sokołowski. All rights reserved.
//

import UIKit

class ItemCell: UITableViewCell {

    @IBOutlet var nameLabel: UILabel!
    @IBOutlet var serialNumberLabel: UILabel!
    @IBOutlet var valueLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        nameLabel.adjustsFontForContentSizeCategory = true
        serialNumberLabel.adjustsFontForContentSizeCategory = true
        valueLabel.adjustsFontForContentSizeCategory = true
    }
    
    
}
