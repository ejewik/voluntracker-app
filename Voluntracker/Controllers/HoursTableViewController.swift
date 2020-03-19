//
//  ViewController.swift
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
    var safeArea: UILayoutGuide!
    
    var hoursEntries = [HoursEntry]()
    var hoursTableView: UITableView = HoursTableView()
    var dummyData : [String] = ["bake sale", "fundraiser", "blanket making"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        prepareTableView()
        //addConstraintsToTableView()
    }

    func prepareTableView() {
        hoursTableView.dataSource = self
        hoursTableView.delegate = self
        hoursTableView.register(HoursTableViewCell.self, forCellReuseIdentifier: "HoursTableViewCell")
        view.addSubview(hoursTableView)
        hoursTableView.translatesAutoresizingMaskIntoConstraints = false
    }
    
    
}

    extension HoursTableViewController {
        
        override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dummyData.count
            
        }
        
        override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell = hoursTableView.dequeueReusableCell(withIdentifier: "HoursTableViewCell", for: indexPath) as! HoursTableViewCell
            //let hoursEntry = hoursEntries[indexPath.row]
            let hoursEntry = dummyData[indexPath.row]
            cell.textLabel?.text = "testing"
            //cell = setCellTextFromHoursEntry(currentCell: cell, hoursEntry: hoursEntry)
            return cell
        }
        
        func setCellTextFromHoursEntry(currentCell: HoursTableViewCell, hoursEntry: HoursEntry) -> HoursTableViewCell {
            currentCell.entryTitleLabel.text = hoursEntry.entryTitle;
            currentCell.organizationLabel.text = hoursEntry.organization;
            currentCell.dateLabel.text = "placeholder date"
            currentCell.hourLabel.text = String(hoursEntry.hours);
            currentCell.minuteLabel.text = String(hoursEntry.minutes);
            
            return currentCell;
        }
}



