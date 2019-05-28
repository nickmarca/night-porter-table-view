//
//  ViewController.swift
//  Night Porter Table View
//
//  Created by Nicholas Marcaccini on 5/19/19.
//  Copyright © 2019 Nicholas Marcaccini. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You selected row \(indexPath.row) in section \(indexPath.section)")
    }
    
    @IBAction func toggleDarkMode(_ sender: Any) {
        let mySwitch = sender as! UISwitch
        
        if mySwitch.isOn {
            view.backgroundColor = UIColor.darkGray
        } else {
            view.backgroundColor = UIColor.white 
        }
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        tableView.backgroundColor = UIColor.clear
        
        return 3
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        switch section {
        case 0:
            return dailyTasks.count
        case 1:
            return weeklyTasks.count
        case 2:
            return monthlyTasks.count
        default:
             return 0
            
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        switch section {
        case 0:
            return "Daily Tasks"
        case 1:
            return "Weekly Tasks"
        case 2:
            return "Monthly Tasks"
        default:
            return nil
        }
    } 
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        
        switch indexPath.section {
        case 0:
            cell.textLabel?.text = dailyTasks[indexPath.row].name
        case 1:
            cell.textLabel?.text = weeklyTasks[indexPath.row]
        case 2:
            cell.textLabel?.text = monthlyTasks[indexPath.row]
        default:
            cell.textLabel?.text = "This shouldn't happen"
        }
        
        cell.backgroundColor = UIColor.clear
        
        return cell
    }
    
    
    let dailyTasks = [
        Task(name: "Check all windows", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check all doors", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Is the boiler fueled?", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Check the mailbox", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Empty trash containers", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "If freezing, check water pipes", type: .daily, completed: false, lastCompleted: nil),
        Task(name: "Document \"strange and unusual\" occurences", type: .daily, completed: false, lastCompleted: nil)
    ]
    
    let weeklyTasks = [
        "Check inside all cabins",
        "Flush all lavatories in cabins",
        "Walk the perimeter of property",
    ]
    
    let monthlyTasks = [
        "Test security alarm",
        "Test motion detectors",
        "Test smoke alarms",
    ]

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

