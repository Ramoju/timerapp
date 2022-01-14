//
//  ViewController.swift
//  Timer
//
//  Created by Sravan Sriramoju on 2022-01-12.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    
    var timer = Timer()
    var (hours, minutes, seconds, fractions) = (0,0,0,0)
    var timerRunning = false
    var lapnum = 0
    
    @IBOutlet weak var timeRunningLB: UILabel!
    @IBOutlet weak var lapButton: UIButton!
    @IBOutlet weak var startButton: UIButton!
    
    @IBOutlet weak var lapsTV: UITableView!
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return lapList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //create an object of the car and let it get the value from the car list
        let lapObj=lapList[indexPath.row]
        //create a cell as a part of the CarTableViewCell
        let cell = tableView.dequeueReusableCell(withIdentifier: "lapsCell") as? LapTableViewCell
        //setup the cell by calling the funtion setCarCell from the CarTableViewCell
        cell?.setLapCell(Obj: lapObj)
        return cell!
    }
    //function to set the header
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "\tLap Time\t\t\t\t\tLap number"
    }
    
    var lapList = [Lap]()
    
    @IBAction func startTimer(_ sender: UIButton) {
        if (fractions > 0 || seconds > 0 || minutes > 0 || hours > 0){
            timerRunning = false
            timer.invalidate()
            startButton.setTitle("Start", for: .normal)
            lapButton.setTitle("Reset", for: .normal)
        }
        else{
            timerRunning = true
            startButton.setTitle("Stop", for: .normal)
        timer = Timer.scheduledTimer(timeInterval: 0.01, target: self, selector: #selector(ViewController.runTimer), userInfo: nil, repeats: true)
        }
    }
    
    @IBAction func lapSave(_ sender: UIButton) {
        if timerRunning == true {
            lapnum += 1
        lapList.append(Lap(lapNumber: "Lap \(lapnum)", lapTime: "\(hours):\(minutes):\(seconds):\(fractions)"))
        lapsTV.reloadData();
        }
        else {
            fractions = 0
            seconds = 0
            minutes = 0
            hours = 0
            timeRunningLB.text = "\(hours):\(minutes):\(seconds):\(fractions)"
            startButton.setTitle("Start", for: .normal)
            lapButton.setTitle("Lap", for: .normal)
            lapList.removeAll()
            lapsTV.reloadData()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        startButton.setTitle("Start", for: .normal)
        lapButton.setTitle("Lap", for: .normal)
        lapsTV.delegate=self
        lapsTV.dataSource=self
        //lapsTV.rowHeight=60
        
    }
    
    @objc func runTimer(){
        
        fractions += 1
        if fractions > 99 {
            seconds += 1
            fractions = 0
        }
        
        if seconds == 60 {
            minutes += 1
            seconds = 0
        }
        
        if minutes == 60{
            hours += 1
            minutes = 0
        }
        
        timeRunningLB.text = "\(hours):\(minutes):\(seconds):\(fractions)"
    }


}

