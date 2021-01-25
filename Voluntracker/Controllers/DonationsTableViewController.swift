//
//  DonationsTableViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 1/24/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class DonationsTableViewController: UITableViewController {

    @IBOutlet var hourDonationSegmentedButton: UISegmentedControl!
    @IBOutlet var addEntryButton: UIBarButtonItem!
    @IBOutlet var editEntryButton: UIButton!
    
    var donationsEntries = [DonationsEntry]() {
        didSet {
            self.tableView.reloadData()
            CoreDataHelper.saveDonationsEntry()
        }
    }
    
    let cellReuseIdentifier = "DonationsTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        donationsEntries = CoreDataHelper.retrieveDonationsEntries()
    }

    func prepareTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "displayDonationsEntry":
            print("Segue to displayDonationsEntryViewController - display donations entry")
            guard let indexPath = tableView.indexPathForSelectedRow else { return }
            let donationsEntry = donationsEntries[indexPath.row]
            let destination = segue.destination as! CreateDonationsEntryViewController
            destination.donationsEntry = donationsEntry
    
        default:
            print("unexpected segue identifier open entry")
            
        }
    }
    
    @IBAction func unwindToDonationsTableViewController(sender: UIStoryboardSegue) {
        donationsEntries = CoreDataHelper.retrieveDonationsEntries()
        print("unwinding... donations")
        
    }
    
}

    extension DonationsTableViewController {
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return donationsEntries.count
            
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell : DonationsTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! DonationsTableViewCell
            let donationsEntry = donationsEntries[indexPath.row]
            cell = setCellTextFromDonationsEntry(currentCell: cell, donationsEntry: donationsEntry)
            
            return cell
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func setCellTextFromDonationsEntry(currentCell: DonationsTableViewCell, donationsEntry: DonationsEntry) -> DonationsTableViewCell {
            currentCell.entryTitleLabel?.text = donationsEntry.entryTitle
            currentCell.organizationLabel?.text = donationsEntry.organization
            currentCell.dateLabel?.text = donationsEntry.date!.convertDateToString()
            
            if(currentCell.entryTitleLabel.text == "") {
                currentCell.entryTitleLabel.text = "event title"
                currentCell.organizationLabel.text = "organization"
            }
            
            return currentCell;
        }
        
        override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {

                 if editingStyle == .delete {
                    let entryToDelete = donationsEntries[indexPath.row]
                    CoreDataHelper.deleteDonationsEntry(entry: entryToDelete)
                    donationsEntries = CoreDataHelper.retrieveDonationsEntries()
            }
        }
}



