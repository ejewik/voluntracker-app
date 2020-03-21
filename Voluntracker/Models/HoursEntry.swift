//
//  HoursEntry.swift
//  Voluntracker
//
//  Created by Emily Jewik on 3/19/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import Foundation

class HoursEntryTest {
    
    //MARK: Properties
    
    var hours: Int
    var minutes: Int
    var entryTitle: String
    var organization: String
    var content: String
    var date: Date
    var timeFrom: Date?
    var timeTo: Date?
    
    init(hours: Int, minutes: Int, entryTitle: String, organization: String, content: String, date: Date) {
        self.hours = hours
        self.minutes = minutes
        self.entryTitle = entryTitle
        self.organization = organization
        self.content = content
        self.date = date
    }
    
    
    
}
