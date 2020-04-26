//
//  TimerTableViewController.swift
//  stopWatch
//
//  Created by Griffin Rades on 1/29/20.
//  Copyright © 2020 GriffinRades. All rights reserved.
//

import UIKit

class TimerTableViewController: UITableViewController {

    let cellId = "timeCell"
    var times = ["10:00.00","20:00.00"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Loaded")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        print(times.count)
        return times.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as? TimerTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TimerTableViewCell.")
        }
        
        let time = self.times[indexPath.row]
        
        print(time)
        
        cell.cellTimer.text = time
        
        return cell
    }
}
