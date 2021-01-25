//
//  CreateDonationsEntryViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 3/21/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class CreateDonationsEntryViewController : UIViewController {
    
    //MARK: Properties
    
    var donationsEntry: DonationsEntry?
    
    @IBOutlet var eventTitleTextField: UITextField!
    @IBOutlet var dateTextField: UITextField!
    @IBOutlet var organizationTextField: UITextField!
    @IBOutlet var contentTextView: UITextView!
    @IBOutlet var topLabel: UILabel!
    @IBOutlet var middleLabel: UILabel!
    @IBOutlet var bottomLabel: UILabel!
    @IBOutlet var doneButton: UIButton!
    
    var dateFieldPicker : UIDatePicker = UIDatePicker()
    
    override func viewDidLoad() {
        hideScrollLabels()
        doneButton.layer.cornerRadius = 20
        dateTextField = dateFieldPicker.setUpDatePickerEmbeddedInTextField(textField: dateTextField, isTimePicker: false)
        dateFieldPicker.addTarget(self, action: #selector(CreateDonationsEntryViewController.dateChanged(datePicker:)), for: .valueChanged)

            
            if let donationsEntry = donationsEntry {
                contentTextView.text = donationsEntry.content
                eventTitleTextField.text = donationsEntry.entryTitle
                organizationTextField.text = donationsEntry.organization
                dateFieldPicker.date = donationsEntry.date!

                dateTextField.text = donationsEntry.date?.convertDateToString()
                
                
            } else {
                
                contentTextView.text = ""
                eventTitleTextField.text = ""
                organizationTextField.text = ""
                dateFieldPicker.date = Date()

                dateTextField.text = dateFieldPicker.date.convertDateToString()
            }
    }
    
    func hideScrollLabels() {
        topLabel.isHidden = true
        middleLabel.isHidden = true
        bottomLabel.isHidden = true
    }

    @objc func dateChanged(datePicker: UIDatePicker) {
        dateTextField.text = datePicker.date.convertDateToString()
    }
    
    func setDonationsEntryAttributes() -> DonationsEntry {
        donationsEntry?.entryTitle = eventTitleTextField.text ?? ""
        donationsEntry?.content = contentTextView.text ?? ""
        donationsEntry?.organization = organizationTextField.text ?? ""
        donationsEntry?.date = dateFieldPicker.date
        
        return donationsEntry!
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier,
        let destination = segue.destination as? DonationsTableViewController
        else { return }
        
        switch identifier {
            
        case "done" where donationsEntry == nil:
            
            donationsEntry = CoreDataHelper.newDonationsEntry()
            donationsEntry = setDonationsEntryAttributes()
            
            CoreDataHelper.saveDonationsEntry()
            
            print("done button tapped")
            
        case "done" where donationsEntry != nil:
            
            donationsEntry = setDonationsEntryAttributes()
            
            CoreDataHelper.saveDonationsEntry()
                        
        default:
            print("unexpected segue identifier make entry")
        }
    }
}
