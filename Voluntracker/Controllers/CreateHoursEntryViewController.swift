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
        addBorderUnderTextField(textField: eventTitleTextField)
        addBorderUnderTextField(textField: organizationTextField)
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
    
    func addBorderUnderTextField(textField: UITextField) {
        let border = CALayer()
        let width = CGFloat(1.0)
        border.borderColor = UIColor.darkGray.cgColor
        border.frame = CGRect(x: 0, y: textField.frame.size.height - width, width: textField.frame.size.width, height: textField.frame.size.height)
        
        border.borderWidth = width
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "done":
            let hoursEntry = HoursEntryTest()
            hoursEntry.entryTitle = eventTitleTextField.text ?? ""
            hoursEntry.content = contentTextView.text ?? ""
            hoursEntry.organization = organizationTextField.text ?? ""
            
            let destination = segue.destination as! HoursTableViewController
            destination.dummyData.append(hoursEntry)
            destination.tableView.reloadData()
            
            print("done button tapped")
            
        default:
            print("unexpected segue identifier")
        }
    }
}
