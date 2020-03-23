//
//  HoursTableViewCell.swift
//  Voluntracker
//
//  Created by Emily Jewik on 1/29/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class HoursTableViewCell : UITableViewCell {
    
    @IBOutlet var entryTitleLabel : UILabel!
    @IBOutlet var organizationLabel : UILabel!
    @IBOutlet var dateLabel : UILabel!
    @IBOutlet var hourLabel : UILabel! = {
        let label = UILabel()
        label.layer.cornerRadius = 20
        return label
    }()
    @IBOutlet var minuteLabel : UILabel!
    
}
