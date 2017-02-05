//
//  HomeVC.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 01/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import UIKit



class HomeVC: UIViewController {

    
    @IBOutlet weak var menuName: UILabel!
    @IBOutlet weak var menuRatings: UILabel!
    @IBOutlet weak var menuVID: UILabel!
    @IBOutlet weak var menuView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.isHidden = true
        menuView.isUserInteractionEnabled = false
        
        menuName.text = PfName
        menuVID.text = PfVID
        menuRatings.text = "AS\(Int(PfRatingATC)! - 1) - FS\(Int(PfRatingPilot)! - 1)"
    }
    
    override func viewWillAppear(_ animated: Bool) {
        self.navigationController?.isNavigationBarHidden = false
    }

    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    
    
    @IBAction func menuAction(_ sender: Any) {
        if menuView.isHidden == false {
            menuView.isHidden = true
            menuView.isUserInteractionEnabled = false
        } else {
            menuView.isHidden = false
            menuView.isUserInteractionEnabled = true
        }
        
    }
    

}
