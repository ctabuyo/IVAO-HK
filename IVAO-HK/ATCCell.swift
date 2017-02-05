//
//  ATCCell.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 05/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import UIKit

class ATCCell: UITableViewCell {

    @IBOutlet weak var ratingImg: UIImageView!
    @IBOutlet weak var callsignLbl: UILabel!
    @IBOutlet weak var VIDLbl: UILabel!
    @IBOutlet weak var freqLbl: UILabel!
    @IBOutlet weak var timeLbl: UILabel!
    @IBOutlet weak var placeHolderImg: UIImageView!
    
    var atfa : onlineATC!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(atf: onlineATC) {
        self.atfa = atf
        ratingImg.image = UIImage(named: "A\(atfa.Rating)")
        callsignLbl.text = atfa.Callsign
        VIDLbl.text = atfa.VID
        freqLbl.text = atfa.Frequency
        timeLbl.text = convertToTimeAndReturn(Time: atfa.ConnectionTime)
    }
    
    func convertToTimeAndReturn(Time: String) -> String {
        let date = NSDate()
        let calendar = NSCalendar.current
        let hourNow2 = calendar.component(.hour, from: date as Date)
        let minutesNow2 = calendar.component(.minute, from: date as Date)
        
        let dateFormatter2 = DateFormatter()
        dateFormatter2.dateFormat = "HH"
        let hourNow = dateFormatter2.date(from: String(hourNow2))
        
        let dateFormatter3 = DateFormatter()
        dateFormatter3.dateFormat = "mm"
        let minutesNow = dateFormatter3.date(from: String(minutesNow2))
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "HHmm"
        let date2 = dateFormatter.date(from: Time)
        let hours = date2?.hours(from: hourNow!)
        let minutes = date2?.minutes(from: minutesNow!)
        
        return "\(hours) : \(minutes)"
        
    }

}
