//
//  CreateHoursEntryViewController.swift
//  Voluntracker
//
//  Created by Emily Jewik on 3/21/20.
//  Copyright © 2020 Emily Jewik. All rights reserved.
//

import UIKit

class CreateHoursEntryViewController : UIViewController {
    
    
    
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let identifier = segue.identifier else { return }
        
        switch identifier {
        case "done":
            print("done button tapped")
    
        default:
            print("unexpected segue identifier")
        }
    }
}
