//
//  PilotsCell.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 05/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import UIKit

class PilotsCell: UITableViewCell {
    
    @IBOutlet weak var ratingImg: UIImageView!
    @IBOutlet weak var callsignLbl: UILabel!
    @IBOutlet weak var vidLbl: UILabel!
    @IBOutlet weak var airportsLbl: UILabel!
    @IBOutlet weak var infoLbl: UILabel!
    
    
    var ptraffic : onlinePilots!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(ptraffic: onlinePilots) {
        self.ptraffic = ptraffic
        
        ratingImg.image = UIImage(named: "P\(ptraffic.Rating)")
        callsignLbl.text = ptraffic.Callsign
        vidLbl.text = ptraffic.VID
        airportsLbl.text = "\(ptraffic.Departure) - \(ptraffic.Arrival)"
        infoLbl.text = "\(ptraffic.Squawk)            \(ptraffic.Altitude)ft               \(ptraffic.Speed)kt"
    }

}
