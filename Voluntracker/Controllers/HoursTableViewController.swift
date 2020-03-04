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
    var safeArea: UILayoutGuide!
    
    var hoursEntries = [HoursEntry]()
    var hoursTableView: UITableView = HoursTableView()
    var dummyData : [String] = ["bake sale", "fundraiser", "blanket making"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        safeArea = view.layoutMarginsGuide
        prepareTableView()
        addConstraintsToTableView()
        //setRowSizeForTableView()
    }

    func prepareTableView() {
        hoursTableView.dataSource = self
        hoursTableView.delegate = self
        hoursTableView.register(HoursTableViewCell.self, forCellReuseIdentifier: "HoursTableViewCell")
        view.addSubview(hoursTableView)
        hoursTableView.translatesAutoresizingMaskIntoConstraints = false
        //hoursTableView.rowHeight = UITableView.automaticDimension
        //hoursTableView.estimatedRowHeight = 44
    }
    
    func addConstraintsToTableView() {
        hoursTableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
        hoursTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        hoursTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        hoursTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }
    
    func setRowSizeForTableView() {
        hoursTableView.rowHeight = UITableView.automaticDimension
        hoursTableView.estimatedRowHeight = 44
        
    }


}

    extension HoursTableViewController {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return dummyData.count
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell = hoursTableView.dequeueReusableCell(withIdentifier: "HoursTableViewCell", for: indexPath) as! HoursTableViewCell
            //let hoursEntry = hoursEntries[indexPath.row]
            let hoursEntry = dummyData[indexPath.row]
            cell.textLabel?.text = "testing"
            //cell = setCellTextFromHoursEntry(currentCell: cell, hoursEntry: hoursEntry)
            return cell
        }
        
        func setCellTextFromHoursEntry(currentCell: HoursTableViewCell, hoursEntry: HoursEntry) -> HoursTableViewCell {
//            currentCell.entryTitleLabel.text = hoursEntry.entryTitle;
//            currentCell.organizationLabel.text = hoursEntry.organization;
//            currentCell.dateLabel.text = "placeholder date"
//            currentCell.hourLabel.text = String(hoursEntry.hours);
//            currentCell.minuteLabel.text = String(hoursEntry.minutes);
            
            return currentCell;
        }
}



