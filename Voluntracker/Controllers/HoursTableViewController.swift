//
//  HoursTableViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 1/24/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class HoursTableViewController: UITableViewController {
    
    //TODO: figure out how to refactor ui code into another file
    //TODO: add operations (delete, cancel entry)
    //TODO: figure out how to handle segmented control for donations
    //also edit entry button iboutlet is not connected
    //possible approach to refactoring date code: use date extension and use text field as function arg and keep #selector part in VC?
    //need to make time to rebuild createentryvc ui from scratch

    @IBOutlet var hourDonationSegmentedButton: UISegmentedControl!
    @IBOutlet var addEntryButton: UIButton!
    @IBOutlet var editEntryButton: UIButton!
    
    var hoursEntries = [HoursEntry]() {
        didSet {
            self.tableView.reloadData()
            CoreDataHelper.saveHoursEntry() //see if this is necessary
        }
    }
    
    let cellReuseIdentifier = "HoursTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        hoursEntries = CoreDataHelper.retrieveHoursEntries()
    }

    func prepareTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayHoursEntry":
            print("Segue to displayHoursEntryViewController - display hours entry")
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let hoursEntry = hoursEntries[indexPath.row]
            let destination = segue.destination as! CreateHoursEntryViewController
            destination.hoursEntry = hoursEntry
    
        default:
            print("unexpected segue identifier open entry")
            
        }
    }
    
    @IBAction func unwindToHoursTableViewController(sender: UIStoryboardSegue) {
        hoursEntries = CoreDataHelper.retrieveHoursEntries()
        
    }
    
}

    extension HoursTableViewController {
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return hoursEntries.count
            
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell : HoursTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! HoursTableViewCell
            let hoursEntry = hoursEntries[indexPath.row]
            cell = setCellTextFromHoursEntry(currentCell: cell, hoursEntry: hoursEntry)
            
            return cell
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func setCellTextFromHoursEntry(currentCell: HoursTableViewCell, hoursEntry: HoursEntry) -> HoursTableViewCell {
            currentCell.entryTitleLabel?.text = hoursEntry.entryTitle
            currentCell.organizationLabel?.text = hoursEntry.organization
            currentCell.dateLabel?.text = hoursEntry.date!.convertDateToString()
            currentCell.hourLabel?.text = String(hoursEntry.hours)
            currentCell.minuteLabel?.text = String(hoursEntry.minutes)
            
            if(currentCell.entryTitleLabel.text == "") {
                currentCell.entryTitleLabel.text = "event title"
                currentCell.organizationLabel.text = "organization"
            }
            
            return currentCell;
        }
}



