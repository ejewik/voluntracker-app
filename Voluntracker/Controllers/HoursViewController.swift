//
//  ViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 1/24/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class HoursViewController: UITableViewController{

    @IBOutlet var hourDonationSegmentedButton: UISegmentedControl!
    @IBOutlet var addEntryButton: UIButton!
    @IBOutlet var editEntryButton: UIButton!
    
    var hoursEntries = [HoursEntry]()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        hoursEntries.append(HoursEntry())
    }





    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return hoursEntries.count;
        
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "HoursTableViewCell", for: indexPath) as! HoursTableViewCell
        let hoursEntry = hoursEntries[indexPath.row]
        cell = makeCellFromHoursEntry(currentCell: cell, hoursEntry: hoursEntry)
        return cell
    }
}

    extension HoursViewController {
        
        func makeCellFromHoursEntry(currentCell: HoursTableViewCell, hoursEntry: HoursEntry) -> HoursTableViewCell {
            currentCell.entryTitleLabel.text = hoursEntry.entryTitle;
            currentCell.organizationLabel.text = hoursEntry.organization;
            //currentCell.dateLabel.text = hoursEntry.date?.convertToString() ?? "unknown"
            currentCell.hourLabel.text = String(hoursEntry.hours);
            currentCell.minuteLabel.text = String(hoursEntry.minutes);
            
            return currentCell;
        }
}



