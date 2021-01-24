//
//  CreateHoursEntryViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 3/21/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class CreateHoursEntryViewController : UIViewController {
    
    //MARK: Properties
    
    var hoursEntry: HoursEntry?
    
    @IBOutlet var eventTitleTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var eventStartTimeTextField: UITextField!
    @IBOutlet var eventEndTimeTextField: UITextField!
    @IBOutlet var organizationTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var middleLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    var dateFieldPicker : UIDatePicker = UIDatePicker()
    var eventStartTimePicker : UIDatePicker = UIDatePicker()
    var eventEndTimePicker: UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        hideScrollLabels()
        doneButton.layer.cornerRadius = 20
        dateTextField = dateFieldPicker.setUpDatePickerEmbeddedInTextField(textField: dateTextField, isTimePicker: false)
        eventStartTimeTextField = eventStartTimePicker.setUpDatePickerEmbeddedInTextField(textField: eventStartTimeTextField, isTimePicker: true)
        eventEndTimeTextField = eventEndTimePicker.setUpDatePickerEmbeddedInTextField(textField: eventEndTimeTextField, isTimePicker: true)
        dateFieldPicker.addTarget(self, action: #selector(CreateHoursEntryViewController.dateChanged(datePicker:)), for: .valueChanged)
        eventStartTimePicker.addTarget(self, action: #selector(CreateHoursEntryViewController.eventStartTimeChanged(datePicker:)), for: .valueChanged)
        eventEndTimePicker.addTarget(self, action: #selector(CreateHoursEntryViewController.eventEndTimeChanged(datePicker:)), for: .valueChanged)

            
            if let hoursEntry = hoursEntry {
                contentTextView.text = hoursEntry.content
                eventTitleTextField.text = hoursEntry.entryTitle
                organizationTextField.text = hoursEntry.organization
                eventEndTimePicker.date = hoursEntry.timeTo!
                eventStartTimePicker.date = hoursEntry.timeFrom!
                dateFieldPicker.date = hoursEntry.date!
                
                eventStartTimeTextField.text = hoursEntry.timeFrom?.convertTimeToString()
                eventEndTimeTextField.text = hoursEntry.timeTo?.convertTimeToString()
                dateTextField.text = hoursEntry.date?.convertDateToString()
                
                
            } else {
                
                contentTextView.text = ""
                eventTitleTextField.text = ""
                organizationTextField.text = ""
                eventEndTimePicker.date = Date()
                eventStartTimePicker.date = Date()
                dateFieldPicker.date = Date()
                
                eventStartTimeTextField.text = eventStartTimePicker.date.convertTimeToString()
                eventEndTimeTextField.text = eventEndTimePicker.date.convertTimeToString()
                dateTextField.text = dateFieldPicker.date.convertDateToString()
            }
        
        
    }
    
    func hideScrollLabels() {
        topLabel.isHidden = true
        middleLabel.isHidden = true
        bottomLabel.isHidden = true
    }
    
    @objc func eventEndTimeChanged(datePicker: UIDatePicker) {
        eventEndTimeTextField.text = eventEndTimePicker.date.convertTimeToString()
    }

    @objc func eventStartTimeChanged(datePicker: UIDatePicker) {
        eventStartTimeTextField.text = eventStartTimePicker.date.convertTimeToString()
    }

    @objc func dateChanged(datePicker: UIDatePicker) {
        dateTextField.text = datePicker.date.convertDateToString()
    }
    
    func setHoursEntryAttributes() -> HoursEntry {
        hoursEntry?.entryTitle = eventTitleTextField.text ?? ""
        hoursEntry?.content = contentTextView.text ?? ""
        hoursEntry?.organization = organizationTextField.text ?? ""
        hoursEntry?.date = dateFieldPicker.date
        hoursEntry?.timeFrom = eventStartTimePicker.date
        hoursEntry?.timeTo = eventEndTimePicker.date
        
        let eventStartTime = hoursEntry!.timeFrom!
        
        let (hoursString, minutesString) = eventStartTime.convertTimeDifference(eventEndTime: hoursEntry!.timeTo!)
        hoursEntry!.hours = Int16(hoursString)!
        hoursEntry!.minutes = Int16(minutesString)!
        
        return hoursEntry!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
        let destination = segue.destination as? HoursTableViewController
        else { return }
        
        switch identifier {
            
        case "done" where hoursEntry == nil:
            
            hoursEntry = CoreDataHelper.newHoursEntry()
            hoursEntry = setHoursEntryAttributes()
            
            CoreDataHelper.saveHoursEntry()
            
            print("done button tapped")
            
        case "done" where hoursEntry != nil:
            
            hoursEntry = setHoursEntryAttributes()
            
            CoreDataHelper.saveHoursEntry()
                        
        default:
            print("unexpected segue identifier make entry")
        }
    }
}
