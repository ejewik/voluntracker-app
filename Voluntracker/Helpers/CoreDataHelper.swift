//
//  CoreDataHelper.swift
//  VolunteerHourTracker
//
//  Created by Emily Jewik on 7/25/18.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import Foundation
import UIKit
import CoreData

struct CoreDataHelper {
    static let hoursContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static let donationContext: NSManagedObjectContext = {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            fatalError()
        }
        
        let persistentContainer = appDelegate.persistentContainer
        let context = persistentContainer.viewContext
        
        return context
    }()
    
    static func newHoursEntry() -> HoursEntry {
        let entry = NSEntityDescription.insertNewObject(forEntityName: "HoursEntry", into: hoursContext) as! HoursEntry
        
        return entry
    }
    
    
    static func saveHoursEntry() {
        do {
            try hoursContext.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func deleteHoursEntry(entry: HoursEntry) {
        hoursContext.delete(entry)
        
        saveHoursEntry()
    }
    
    static func retrieveHoursEntries() -> [HoursEntry] {
        do {
            let fetchRequest = NSFetchRequest<HoursEntry>(entityName: "HoursEntry")
            let results = try hoursContext.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    // donation methods
    
    static func newDonationsEntry() -> DonationsEntry {
        let entry = NSEntityDescription.insertNewObject(forEntityName: "DonationsEntry", into: donationContext) as! DonationsEntry
        
        return entry
    }
    
    
    static func saveDonationsEntry() {
        do {
            try donationContext.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func deleteDonationsEntry(entry: DonationsEntry) {
        donationContext.delete(entry)
        
        saveDonationsEntry()
    }
    
    static func retrieveDonationsEntries() -> [DonationsEntry] {
        do {
            let fetchRequest = NSFetchRequest<DonationsEntry>(entityName: "DonationsEntry")
            let results = try donationContext.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    
}

