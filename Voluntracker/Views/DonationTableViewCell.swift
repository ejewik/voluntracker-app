//
//  DonationTableViewCell.swift
//  Voluntracker
//
//  Created by Emily Jewik on 1/29/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class DonationTableViewCell : UITableViewCell {
    
    @IBOutlet var entryTitleLabel: UILabel? = {
        let label = UILabel()
        return label
    }()
    
    @IBOutlet var organizationLabel: UILabel? = {
        let label = UILabel()
        return label
    }()
    
    @IBOutlet var dateLabel: UILabel? = {
        let label = UILabel()
        return label
    }()
    
    @IBOutlet var itemCountLabel: UILabel? = {
        let label = UILabel()
        return label
    }()
    
    @IBOutlet var dollarCountLabel: UILabel? = {
        let label = UILabel()
        return label
    }()
}
