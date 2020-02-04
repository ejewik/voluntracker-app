//
//  ViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 1/24/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class HoursTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    var hourDonationSegmentedButton: UISegmentedControl!
    var addEntryButton: UIButton!
    var editEntryButton: UIButton!
    
    var hoursEntries = [HoursEntry]()
    var tableView: HoursTableView = HoursTableView()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hoursEntries.append(HoursEntry())
        self.tableView.register(HoursTableViewCell.self, forCellReuseIdentifier: "HoursTableViewCell")
    }


}

    extension HoursTableViewController {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return hoursEntries.count;
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell = tableView.dequeueReusableCell(withIdentifier: "HoursTableViewCell", for: indexPath) as! HoursTableViewCell
            let hoursEntry = hoursEntries[indexPath.row]
            cell = makeCellFromHoursEntry(currentCell: cell, hoursEntry: hoursEntry)
            return cell
        }
        
        func makeCellFromHoursEntry(currentCell: HoursTableViewCell, hoursEntry: HoursEntry) -> HoursTableViewCell {
            currentCell.entryTitleLabel.text = hoursEntry.entryTitle;
            currentCell.organizationLabel.text = hoursEntry.organization;
            //currentCell.dateLabel.text = hoursEntry.date?.convertToString() ?? "unknown"
            currentCell.hourLabel.text = String(hoursEntry.hours);
            currentCell.minuteLabel.text = String(hoursEntry.minutes);
            
            return currentCell;
        }
}



