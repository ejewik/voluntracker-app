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
    
    var hoursEntries = [String]()
    var hoursTableView: UITableView = HoursTableView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        prepareTableView()
        addConstraintsToTableView()
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
        hoursTableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        hoursTableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        hoursTableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        hoursTableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
    }


}

    extension HoursTableViewController {
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return 1;
            
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            
            var cell = hoursTableView.dequeueReusableCell(withIdentifier: "HoursTableViewCell", for: indexPath) as! HoursTableViewCell
            //let hoursEntry = hoursEntries[indexPath.row]
            cell.hourLabel.text = "6"
            cell.minuteLabel.text = "6"
            cell.dateLabel.text = "6"
            cell.organizationLabel.text = "6"
            //cell = makeCellFromHoursEntry(currentCell: cell, hoursEntry: hoursEntry)
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



