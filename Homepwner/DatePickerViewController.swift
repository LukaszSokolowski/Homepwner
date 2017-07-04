//
//  DatePickerViewController.swift
//  Homepwner
//
//  Created by Łukasz Sokołowski on 03.07.2017.
//  Copyright © 2017 Łukasz Sokołowski. All rights reserved.
//

import UIKit

class DatePickerViewController: UIViewController {

    var currentItem: Item!
    
    override func viewWillAppear(_ animated: Bool) {
        navigationItem.title = "Set a date"
    }
    
    override func viewWillDisappear(_ animated: Bool) {
    
    }

    @IBAction func datePickerSet(_ sender: UIDatePicker) {
        currentItem.dateCreated = sender.date
    }
    
}
