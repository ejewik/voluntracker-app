//
//  DatePickerExtension.swift
//  Voluntracker
//
//  Created by Emily Jewik on 12/5/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit

extension UIDatePicker {
    
    //TODO: when adding create donation VC fill in else statement
    
    func setUpDatePickerEmbeddedInTextField(textField: UITextField, isTimePicker: Bool) -> UITextField {
        
        if isTimePicker == true {
            textField.text = self.date.convertTimeToString()
            self.datePickerMode = .time
            
        } else {
            textField.text = self.date.convertDateToString()
            self.datePickerMode = .date
        }
        
        textField.inputView = self
        return textField
    }
}
