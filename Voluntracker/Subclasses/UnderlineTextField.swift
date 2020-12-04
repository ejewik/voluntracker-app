//
//  UnderlineTextField.swift
//  Voluntracker
//
//  Created by Emily Jewik on 12/4/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit

class UnderlineTextField : UITextField {
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: self.frame.size.height - width, width: self.frame.size.width, height: self.frame.size.height)
        
        border.borderWidth = width
        self.layer.addSublayer(border)
        self.layer.masksToBounds = true
    }
}
