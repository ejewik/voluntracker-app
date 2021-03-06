//
//  DonationTableViewCell.swift
//  Voluntracker
//
//  Created by Emily Jewik on 1/29/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class DonationsTableViewCell : UITableViewCell {
    
    @IBOutlet var entryTitleLabel : UILabel!
    @IBOutlet var organizationLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    
    //TODO: Fix constraint issue - could be what's causing this to break
    
    @IBOutlet var dollarLabel : UILabel! = {
        let label = UILabel()
        label.layer.cornerRadius = 20
        return label
    }()
}
