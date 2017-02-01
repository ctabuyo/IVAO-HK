//
//  IVAOProfile.swift
//  IVAO-HK
//
//  Created by Cristian Tabuyo on 01/02/2017.
//  Copyright © 2017 Cristian Tabuyo. All rights reserved.
//

import Foundation

class IVAOProfile {
    private var _VID: String!
    private var _firstName: String!
    private var _lastName: String!
    private var _rating: String!
    private var _ratingATC: String!
    private var _ratingPilot: String!
    private var _Division: String!
    private var _Country: String!
    private var _Skype: String!
    
    
    var VID : String {
        get {
            if _VID == nil {
                _VID = ""
            }
            return _VID
        }
    }
    
    var firstName : String {
        get {
            if _firstName == nil {
                _firstName = ""
            }
            return _firstName
        }
    }
    
    var lastName : String {
        get {
            if _lastName == nil {
                _lastName = ""
            }
            return _lastName
        }
    }
    
    var rating : String {
        get {
            if _rating == nil {
                _rating = ""
            }
            return _rating
        }
    }
    
    var ratingATC : String {
        get {
            if _ratingATC == nil {
                _ratingATC = ""
            }
            return _ratingATC
        }
    }
    
    var ratingPilot : String {
        get {
            if _ratingPilot == nil {
                _ratingPilot = ""
            }
            return _ratingPilot
        }
    }
    
    var Division : String {
        get {
            if _Division == nil {
                _Division = ""
            }
            return _Division
        }
    }
    
    var Country : String {
        get {
            if _Country == nil {
                _Country = ""
            }
            return _Country
        }
    }
    
    var Skype : String {
        get {
            if _Skype == nil {
                _Skype = ""
            }
            return _Skype
        }
    }
    
    init(VID: String, firstName: String, lastName: String, rating: String, ratingATC: String, ratingPilot: String, Division: String, Country: String, Skype:String) {
        self._VID = VID
        self._firstName = firstName
        self._lastName = lastName
        self._rating = rating
        self._ratingATC = ratingATC
        self._ratingPilot = ratingPilot
        self._Division = Division
        self._Country = Country
        self._Skype = Skype
    }
    
   
}
