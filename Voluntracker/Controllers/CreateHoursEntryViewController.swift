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
        formatContentTextView()
        doneButton.layer.cornerRadius = 20
        setUpDatePickerEmbeddedInTextField()
        setUpEventStartPickerEmbeddedInTextField()
        setUpEventEndPickerEmbeddedInTextField()
        
    }
    
    func hideScrollLabels() {
        topLabel.isHidden = true
        middleLabel.isHidden = true
        bottomLabel.isHidden = true
    }
    
    func formatContentTextView() {
        contentTextView.layer.borderWidth = 0.4
        contentTextView.layer.borderColor = UIColor.lightGray.cgColor
        contentTextView.layer.cornerRadius = 3
        contentTextView.clipsToBounds = true
    }
    
    func setUpDatePickerEmbeddedInTextField() {
        dateFieldPicker.datePickerMode = .date
        dateTextField.text = dateFieldPicker.date.convertToString()
        dateFieldPicker.addTarget(self, action: #selector(CreateHoursEntryViewController.dateChanged(datePicker:)), for: .valueChanged)
        dateTextField.inputView = dateFieldPicker
    }
    
    func setUpEventStartPickerEmbeddedInTextField() {
        eventStartTimePicker.datePickerMode = .time
        eventStartTimeTextField.text = eventStartTimePicker.date.convertTimeToString()
        eventStartTimePicker.addTarget(self, action: #selector(CreateHoursEntryViewController.eventStartTimeChanged(datePicker:)), for: .valueChanged)
        eventStartTimeTextField.inputView = eventStartTimePicker
    }
    
    func setUpEventEndPickerEmbeddedInTextField() {
        eventEndTimePicker.datePickerMode = .time
        eventEndTimeTextField.text = eventEndTimePicker.date.convertTimeToString()
        eventEndTimePicker.addTarget(self, action: #selector(CreateHoursEntryViewController.eventEndTimeChanged(datePicker:)), for: .valueChanged)
        eventEndTimeTextField.inputView = eventEndTimePicker
    }
    
    @objc func eventEndTimeChanged(datePicker: UIDatePicker) {
        eventEndTimeTextField.text = eventEndTimePicker.date.convertTimeToString()
    }
    
    @objc func eventStartTimeChanged(datePicker: UIDatePicker) {
        eventStartTimeTextField.text = eventStartTimePicker.date.convertTimeToString()
    }
    
    @objc func dateChanged(datePicker: UIDatePicker) {
        dateTextField.text = datePicker.date.convertToString()
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
            hoursEntry = setHoursEntryAttributes()
            
            CoreDataHelper.saveHoursEntry()
                        
        default:
            print("unexpected segue identifier make entry")
        }
    }
}
