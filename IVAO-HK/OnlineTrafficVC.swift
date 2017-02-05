//
//  OnlineTrafficVC.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 05/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class OnlineTrafficVC: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    
    
    
    
    var traffics = [onlinePilots]()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        getTraffic() { () -> () in
          self.tableView.reloadData()
        }
    }
    
    func getTraffic(completed: @escaping DownloadComplete) {
        let parameters : Parameters = ["api_key":"ivaomobileapp", "function":"PIA"]
        Alamofire.request("https://ivao.taip.pw/api/app.php", method: .post, parameters: parameters, headers: nil).responseString { response in
            
            
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    completed()
                    
                    if let data2 = data.data(using: String.Encoding.utf8) {
                        let json = JSON(data: data2)
                        
                        for items in json {
                            let JCallsign = items.0
                            let JVID = items.1["VID"].stringValue
                            let Jrating = items.1["rating"].stringValue
                            let Jcoordinate = items.1["coordinate"].stringValue
                            let Jsquawk = items.1["squawk"].stringValue
                            let Jaltitude = items.1["altitude"].stringValue
                            let Jspeed = items.1["speed"].stringValue
                            let Jdeparture = items.1["departure"].stringValue
                            let Jdestination = items.1["destination"].stringValue
                            
                            let traffic = onlinePilots(callsign: JCallsign, vid: JVID, rating: Jrating, coordinate: Jcoordinate, squawk: Jsquawk, altitude: Jaltitude, speed: Jspeed, departure: Jdeparture, arrival: Jdestination)
                            
                            self.traffics.append(traffic)
                        }
                        completed()
                    }
                    
                }
                break
                
            case .failure(_):
                print(response.result.error as Any)
                break
                
            }
        }
        
  
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return traffics.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if let cell = tableView.dequeueReusableCell(withIdentifier: "PilotCell") as! PilotsCell! {
            cell.configureCell(ptraffic: traffics[indexPath.row])
            return cell
        } else {
            return UITableViewCell()
        }
    }

    

}
