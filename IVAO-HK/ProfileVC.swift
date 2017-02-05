//
//  ProfileVC.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 04/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import UIKit

class ProfileVC: UIViewController {
    @IBOutlet weak var userNameLbl: UILabel!
    @IBOutlet weak var pilotRatingLbl: UILabel!
    @IBOutlet weak var atcRatingLbl: UILabel!
    @IBOutlet weak var statusLbl: UILabel!
    @IBOutlet weak var skypeLbl: UILabel!
    @IBOutlet weak var divisionImg: UIImageView!
    @IBOutlet weak var countryImg: UIImageView!
    @IBOutlet weak var countryName: UILabel!
    @IBOutlet weak var divisioName: UILabel!
    @IBOutlet weak var pilotRatingView: UIView!
    @IBOutlet weak var atcRatingView: UIView!
    @IBOutlet weak var logoImg: UIImageView!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        pilotRatingView.layer.cornerRadius = 10.0
        pilotRatingView.clipsToBounds = true
        atcRatingView.layer.cornerRadius = 10.0
        atcRatingView.clipsToBounds = true
        self.navigationController?.isNavigationBarHidden = true
        logoImg.layer.shadowColor = UIColor.black.cgColor
        logoImg.layer.shadowOpacity = 0.85
        logoImg.layer.shadowRadius = 15.0
        logoImg.layer.shadowOffset = CGSize.zero
        setData()
    }
    
    func setData() {
        userNameLbl.text = PfName
        pilotRatingLbl.text = "FS\(Int(PfRatingPilot)! - 1)"
        atcRatingLbl.text = "AS\(Int(PfRatingATC)! - 1)"
        statusLbl.text = "Status:  \(IVAOStatus().translate(status: Int(PfRating)!))"
        skypeLbl.text = "Skype: \(PfSkype)"
        print(PfDivision)
        countryImg.image = UIImage(named: PfCountry.lowercased())
        divisionImg.image = UIImage(named: PfDivision.lowercased())
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    @IBAction func showCountryName(_ sender: Any) {
        countryName.isHidden = false
    }
    
    @IBAction func showDivisionName(_ sender: Any) {
        divisioName.isHidden = false
    }

    @IBAction func goBack(_ sender: Any) {
        _ = navigationController?.popViewController(animated: true)
    }
    

}
