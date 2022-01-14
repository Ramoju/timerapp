//
//  LapTableViewCell.swift
//  Timer
//
//  Created by Sravan Sriramoju on 2022-01-12.
//

import Foundation
import UIKit

class LapTableViewCell: UITableViewCell{
    
    @IBOutlet weak var lapTime: UILabel!
    
    @IBOutlet weak var lapNumber: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

    
    func setLapCell(Obj:Lap)
    {
        lapTime.text = Obj.lapTime
        lapNumber.text = Obj.lapNumber
    }
}
