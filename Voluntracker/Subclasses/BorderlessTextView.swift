//
//  BorderlessTextView.swift
//  Voluntracker
//
//  Created by Emily Jewik on 12/4/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit

class BorderlessTextView : UITextView {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.borderWidth = 0.4
        self.layer.borderColor = UIColor.lightGray.cgColor
        self.layer.cornerRadius = 3
        self.clipsToBounds = true
    }
}
