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
    
    func convertTimeDifference(eventEndTime: Date) -> (hoursString: String, minutesString: String) {
        
        let timeDifference = Calendar.current.dateComponents([.hour, .minute], from: self, to: eventEndTime)
        let hours = String(format: "%d", timeDifference.hour!)
        let minutes = String(format: "%d", timeDifference.minute!)

        return (hours, minutes)
        
       
    }
    
   
}
