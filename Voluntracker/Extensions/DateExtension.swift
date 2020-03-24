//
//  DateHelpers.swift
//  Voluntracker
//
//  Created by Emily Jewik on 3/22/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import Foundation

extension Date {
    func convertToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.medium, timeStyle: DateFormatter.Style.none)
    }
    
    func convertTimeToString() -> String {
        return DateFormatter.localizedString(from: self, dateStyle: DateFormatter.Style.none, timeStyle: DateFormatter.Style.short)
    }
    
   
}
