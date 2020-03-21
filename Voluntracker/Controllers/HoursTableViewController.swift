//
//  HoursTableViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 1/24/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class HoursTableViewController: UITableViewController {

    @IBOutlet var hourDonationSegmentedButton: UISegmentedControl!
    @IBOutlet var addEntryButton: UIButton!
    @IBOutlet var editEntryButton: UIButton!
    
    var hoursEntries = [HoursEntry]()
    var dummyData : [HoursEntryTest] = [HoursEntryTest(hours: 1, minutes: 30, entryTitle: "title", organization: "unicef", content: "content", date: Date(timeIntervalSinceNow: 0)), HoursEntryTest(hours: 2, minutes: 60, entryTitle: "title2", organization: "sorop", content: "content2", date: Date(timeIntervalSinceNow: 0))]
    let cellReuseIdentifier = "HoursTableViewCell"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
    }

    func prepareTableView() {
        self.tableView.dataSource = self
        self.tableView.delegate = self
    }
    
    @IBAction func addHoursEntryButtonTapped() {
        print("hoursEntryButton was tapped")
    }
    
    
}

    extension HoursTableViewController {
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dummyData.count
            
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell : HoursTableViewCell = self.tableView.dequeueReusableCell(withIdentifier: cellReuseIdentifier, for: indexPath) as! HoursTableViewCell
            let hoursEntry = dummyData[indexPath.row]
            cell = setCellTextFromHoursEntry(currentCell: cell, hoursEntry: hoursEntry)
            
            return cell
        }
        
        override func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func setCellTextFromHoursEntry(currentCell: HoursTableViewCell, hoursEntry: HoursEntryTest) -> HoursTableViewCell {
            currentCell.entryTitleLabel?.text = hoursEntry.entryTitle;
            currentCell.organizationLabel?.text = hoursEntry.organization;
            currentCell.dateLabel?.text = "placeholder date"
            currentCell.hourLabel?.text = String(hoursEntry.hours);
            currentCell.minuteLabel?.text = String(hoursEntry.minutes);
            
            return currentCell;
        }
}



