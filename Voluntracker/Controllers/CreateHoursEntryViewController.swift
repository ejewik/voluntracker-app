//
//  CreateHoursEntryViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 3/21/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class CreateHoursEntryViewController : UIViewController {
    
    @IBOutlet var eventTitleTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var eventStartTimeTextField: UITextField!
    @IBOutlet var eventEndTimeTextField: UITextField!
    @IBOutlet var organizationTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "done":
            let hoursEntry = HoursEntryTest()
            hoursEntry.entryTitle = eventTitleTextField.text ?? ""
            hoursEntry.content = contentTextView.text ?? ""
            hoursEntry.organization = organizationTextField.text ?? ""
            //hoursEntry.minutes = 0
            //hoursEntry.hours = 0
            
            let destination = segue.destination as! HoursTableViewController
            destination.dummyData.append(hoursEntry)
            destination.tableView.reloadData()
            
            print("done button tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
