//
//  MapVC.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 05/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import UIKit
import MapKit

class MapVC: UIViewController {
    
    @IBOutlet weak var mapView: MKMapView!
    
    var callsign: String!
    var altitude: String!
    var speed: String!
    var coordinates: String!
    var lon = ""
    var lat = ""
    

    override func viewDidLoad() {
        super.viewDidLoad()

        
        
    }

    override func viewWillAppear(_ animated: Bool) {
        let fullCoordinates = coordinates.characters.split{$0 == " "}.map(String.init)
        let lat1 = fullCoordinates[0]
        lon = fullCoordinates[1]
        lat = lat1.replacingOccurrences(of: ",", with: "", options: NSString.CompareOptions.literal, range:nil)
        print(lat)
        let initialLocation = CLLocation(latitude: Double(lat)!, longitude: Double(lon)!)
        centerMapOnLocation(location: initialLocation)
    }
    
    
    
    let regionRadius: CLLocationDistance = 300000
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate,
                                                                  regionRadius * 2.0, regionRadius * 2.0)
        mapView.setRegion(coordinateRegion, animated: true)
    }
    

    

}
