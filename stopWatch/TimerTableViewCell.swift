//
//  TimerTableViewCell.swift
//  stopWatch
//
//  Created by Griffin Rades on 1/29/20.
//  Copyright © 2020 GriffinRades. All rights reserved.
//

import UIKit

class TimerTableViewCell: UITableViewCell {

    var startDate:Date?
    var stopDate:Date?
    var seconds = 0;
    var timer = Timer();
    var swimmerTime:String?
    var swimmerNum:Int?
    
    @IBOutlet weak var cellTimer: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    @objc func updateTime(){
        let currentDate = Date()
        let timeSinceStart = getTimeAccuratly(currentDate: currentDate)
        
        let (hours, minutes, seconds) = secondsToHoursMinsSeconds(seconds: Int( -1 * timeSinceStart))
        
        //format the time and set it to the label
        self.swimmerTime = String(format: "%02d", hours) + ":" + String(format: "%02d", minutes) + ":" + String(format: "%02d", seconds)
    }
    
    func getTimeAccuratly(currentDate: Date) -> TimeInterval{
           let dateDifference = self.startDate?.timeIntervalSince(currentDate)
           self.seconds = Int(-1 * (Int(dateDifference ?? 0.0))) //get rid of the negative by multiplying by -1
           return dateDifference ?? 0.0
    }
    
    func secondsToHoursMinsSeconds(seconds:Int) -> (Int, Int , Int){
        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
    }


}
