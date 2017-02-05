//
//  OnlineTraffic.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 05/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import Foundation


class onlinePilots {
    var Callsign = "null"
    var VID = "null"
    var Rating = "null"
    var Coordinate = "null"
    var Squawk = "null"
    var Altitude = "null"
    var Speed = "null"
    var Departure = "null"
    var Arrival = "null"
    
    init(callsign: String, vid: String, rating: String, coordinate: String, squawk: String, altitude: String, speed: String, departure : String, arrival: String) {
        self.Callsign = callsign
        self.VID = vid
        self.Rating = rating
        self.Coordinate = coordinate
        self.Squawk = squawk
        self.Altitude = altitude
        self.Speed = speed
        self.Departure = departure
        self.Arrival = arrival
    }
}

class onlineATC {
    var Callsign = "null"
    var VID = "null"
    var Rating = "null"
    var ConnectionTime = "null"
    var Frequency = "null"
    
    init(callsign: String, vid: String, rating: String, connectiontime:String, frequency:String) {
        self.Callsign = callsign
        self.VID = vid
        self.Rating = rating
        self.ConnectionTime = connectiontime
        self.Frequency = frequency
    }
}
