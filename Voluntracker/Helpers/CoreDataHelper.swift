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
    static let context: NSManagedObjectContext = {
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
        let entry = NSEntityDescription.insertNewObject(forEntityName: "HoursEntry", into: context) as! HoursEntry
        
        return entry
    }
    
    
    static func saveHoursEntry() {
        do {
            try context.save()
        } catch let error {
            print("Could not save \(error.localizedDescription)")
        }
    }
    
    static func deleteHoursEntry(entry: HoursEntry) {
        context.delete(entry)
        
        saveHoursEntry()
    }
    
    static func retrieveHoursEntries() -> [HoursEntry] {
        do {
            let fetchRequest = NSFetchRequest<HoursEntry>(entityName: "HoursEntry")
            let results = try context.fetch(fetchRequest)
            
            return results
        } catch let error {
            print("Could not fetch \(error.localizedDescription)")
            
            return []
        }
    }
    
    
}

