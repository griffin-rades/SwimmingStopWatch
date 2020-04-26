//
//  ViewController.swift
//  stopWatch
//
//  Created by Griffin Rades on 1/29/20.
//  Copyright © 2020 GriffinRades. All rights reserved.
//

import UIKit

class TimerViewController: UIViewController, UITableViewDataSource {

    @IBOutlet weak var globalTime: UILabel!
    @IBOutlet weak var numSwimSlider: UISlider!
    @IBOutlet weak var numSwimLabel: UILabel!
    @IBOutlet weak var startStopAllButton: UIButton!
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var swimmerTableView: UITableView!
    
    let cellId = "timeCell"
    
    var running = false
    var globalTimer = Timer()
    var startDate:Date? = nil
    var numSwimmers = 0
    var seconds = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        // Do any additional setup after loading the view.
    }

    @IBAction func sliderFunc(_ sender: Any) {
        numSwimmers = Int(numSwimSlider.value)
        
        numSwimLabel.text = "Swimmers: " + String(numSwimmers)
    }
    func start(){
        swimmerTableView.reloadData()
    }
    @IBAction func startStopAllClicked(_ sender: UIButton) {
        if(!running){
            //Create the timer
            self.globalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(updateTime)), userInfo: nil, repeats: true)
            startDate = Date()
            startStopAllButton.setTitle("STOP ALL", for: .normal)
            self.running = true
            start()
        }else{
            startStopAllButton.setTitle("START ALL", for: .normal)
            self.globalTimer.invalidate()
            self.running = false
            
            self.globalTime.text = "00:00:00"
        }
    }
    
    @objc func updateTime(){
        let currentDate = Date()
        let timeSinceStart = getTimeAccuratly(currentDate: currentDate)
        
        let (hours, minutes, seconds) = secondsToHoursMinsSeconds(seconds: Int( -1 * timeSinceStart))
        
        //format the time and set it to the label
        globalTime.text = String(format: "%02d", hours) + ":" + String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds)
    }
    
    func getTimeAccuratly(currentDate: Date) -> TimeInterval{
           let dateDifference = self.startDate?.timeIntervalSince(currentDate)
           self.seconds = Int(-1 * (Int(dateDifference ?? 0.0))) //get rid of the negative by multiplying by -1
           return dateDifference ?? 0.0
    }
    
    func secondsToHoursMinsSeconds(seconds:Int) -> (Int, Int , Int){
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return numSwimmers
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: self.cellId, for: indexPath) as? TimerTableViewCell  else {
            fatalError("The dequeued cell is not an instance of TimerTableViewCell.")
        }
        
        for i in 0..<numSwimmers{
            
            return cell
        }
        return cell
    }
}

