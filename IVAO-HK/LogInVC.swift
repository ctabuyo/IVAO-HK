//
//  LogInVC.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 01/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import UIKit
import WebKit
import Alamofire
import SwiftyJSON

class LogInVC: UIViewController, UIWebViewDelegate {
    
    @IBOutlet weak var carouselImage: UIImageView!
    @IBOutlet weak var carouselLabel: UILabel!
    @IBOutlet weak var pageViewer: UIPageControl!
    @IBOutlet weak var VIDTextField: UITextField!
    @IBOutlet weak var PassTextField: UITextField!
    @IBOutlet weak var LogInButton: UIButton!
    @IBOutlet weak var SlideshowView: UIView!
    @IBOutlet weak var webView: UIWebView!


    let items = ["Enjoy of ATC coverage in our amazing country...!", "Somethind to add - 1", "Something to add -2"]
    let images = [UIImage(named:"LogIn_Page_1"),UIImage(named:"LogIn_Page_2"), UIImage(named:"LogIn_Page_3")]
    var numberForSlider = 0
    let modelName = UIDevice.current.modelName
    var sendTimer : Timer!

    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Keyboard hides handle
        NotificationCenter.default.addObserver(self, selector: #selector(LogInVC.keyboardWillShow), name: NSNotification.Name.UIKeyboardWillShow, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(LogInVC.keyboardWillHide), name: NSNotification.Name.UIKeyboardWillHide, object: nil)
         sendTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(sendDataAndSegue), userInfo: nil, repeats: true)
        // Web View
        webView.delegate = self
        webView.loadRequest(NSURLRequest(url: NSURL(string: "http://login.ivao.aero/index.php?url=http://ivao.hk") as! URL) as URLRequest)
        // Style components
        adjustLayout()
        self.navigationController?.isNavigationBarHidden = true
        VIDTextField.layer.cornerRadius = 15.0
        VIDTextField.clipsToBounds = true
        PassTextField.layer.cornerRadius = 15.0
        PassTextField.clipsToBounds = true
        LogInButton.layer.cornerRadius = 15.0
        LogInButton.clipsToBounds = true
        LogInButton.backgroundColor = UIColor(red: 214/255, green: 31/255, blue: 40/255, alpha: 0.7)
        VIDTextField.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 0.7)
        PassTextField.backgroundColor = UIColor(red: 238/255, green: 238/255, blue: 238/255, alpha: 0.7)
        // Setup page function
        numberForSlider = Int(arc4random_uniform(3))
        carouselLabel.text = items[numberForSlider]
        pageViewer.numberOfPages = 3
        pageViewer.currentPage = numberForSlider
        _ = Timer.scheduledTimer(timeInterval: 2.5, target: self, selector: #selector(goPageNext), userInfo: nil, repeats: true)
        
    }
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "goToFirstScreen" {
            
        }
    }
    
    func adjustLayout() {
        print(modelName)
        if modelName == "iPhone SE" || modelName == "iPhone 5c" || modelName == "iPhone 5s" || modelName == "iPhone 5"  {
            
        } else if modelName == "iPhone 6" || modelName == "iPhone 6s" || modelName == "iPhone 7" || modelName == "Simulator" {
            
        } else if modelName == "iPhone 6 Plus" || modelName == "iPhone 6s Plus" || modelName == "iPhone 7 Plus" {
            
        }
    }
    
    
    func logIn(ID: String, Pwd: String){
        UserDefaults.standard.setValue(ID, forKey: "IVAO_VID")
        let loadUsernameJS: String = "var inputFields = document.querySelectorAll(\"input[type='text']\"); " +
        "     for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '\(ID)';}"
        let loadText: String = "var inputFields = document.querySelectorAll(\"input[type='password']\"); " +
        "     for (var i = inputFields.length >>> 0; i--;) { inputFields[i].value = '\(Pwd)';}"
        
        webView.stringByEvaluatingJavaScript(from: loadUsernameJS)
        webView.stringByEvaluatingJavaScript(from: loadText)
        
        //submit form
        webView.stringByEvaluatingJavaScript(from: "var passFields = document.querySelectorAll(\"input[type='submit']\"); " +
            "    passFields[0].click()")
        
    }
    
    @IBAction func logInButton(_ sender: Any) {
        logIn(ID: VIDTextField.text!, Pwd: PassTextField.text!)
    }
    
    
    
    func webViewDidFinishLoad(_ webView: UIWebView) {
        let URL = webView.request?.url?.absoluteString
        if URL?.range(of: "TOKEN") != nil {
            let newstr = URL?.components(separatedBy: "IVAOTOKEN=").last
            Token = newstr!
            webView.stopLoading()
        } else {
            
        }
    }
    
    func sendDataAndSegue() {
        if Token != "" {
            self.sendTimer.invalidate()
            postToken(Token: Token) { () -> () in
                let VIDPM = UserDefaults.standard.value(forKey: "IVAO_VID")! as! String
                self.getUserData(VID: VIDPM ) { () -> () in
                    self.performSegue(withIdentifier: "goToFirstScreen", sender: nil)
                }
               
            }
            
        }
        
    }
    
    func getUserData(VID: String, completed: @escaping DownloadComplete) {
        let parameters : Parameters = ["api_key":"ivaomobileapp", "function":"user_info", "vid":VID]
        Alamofire.request("https://ivao.taip.pw/api/app.php", method: .post, parameters: parameters, headers: nil).responseString { response in
            
            
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    completed()
                    
                    if let data2 = data.data(using: String.Encoding.utf8) {
                        let json = JSON(data: data2)
                        
                        PfVID = json[0]["vid"].stringValue
                        PfName = json[0]["name"].stringValue
                        PfRating = json[0]["rating"].stringValue
                        PfRatingATC = json[0]["ratingatc"].stringValue
                        PfRatingPilot = json[0]["ratingpilot"].stringValue
                        PfDivision = json[0]["division"].stringValue
                        PfCountry = json[0]["country"].stringValue
                        PfSkype = json[0]["skype"].stringValue
                        
                    }
                    
                }
                break
                
            case .failure(_):
                print(response.result.error as Any)
                break
                
            }
        }
 
    }
    
    
    func postToken(Token: String, completed: @escaping DownloadComplete) {
        let parameters : Parameters = ["api_key":"ivaomobileapp", "function":"Login", "IVAOTOKEN":Token]
        Alamofire.request("https://ivao.taip.pw/api/app.php", method: .post, parameters: parameters, headers: nil).responseString { response in
            
        
            
            switch(response.result) {
            case .success(_):
                if let data = response.result.value{
                    completed()
                }
                break
                
            case .failure(_):
                print(response.result.error as Any)
                break
                
            }
        }
    }
    
    
    
    func keyboardWillShow(notification: NSNotification) {
        SlideshowView.isHidden = true
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y == 0{
                self.view.frame.origin.y -= keyboardSize.height
            }
        }
        
    }
    
    func keyboardWillHide(notification: NSNotification) {
        SlideshowView.isHidden = false
        if let keyboardSize = (notification.userInfo?[UIKeyboardFrameBeginUserInfoKey] as? NSValue)?.cgRectValue {
            if self.view.frame.origin.y != 0{
                self.view.frame.origin.y += keyboardSize.height
            }
        }
    }
    
    @IBAction func goPageNext(_ sender: Any) {
        let random = Int(arc4random_uniform(3))
        carouselImage.image = images[random]
        carouselLabel.text = items[random]
        
        pageViewer.currentPage = random
    }
    
    
    
    
    

    
}
