//
//  HomeVC.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 01/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import UIKit

class HomeVC: UIViewController {

    
    @IBOutlet weak var menuView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        menuView.isHidden = true
        menuView.isUserInteractionEnabled = false
        self.navigationController?.isNavigationBarHidden = false
        
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
