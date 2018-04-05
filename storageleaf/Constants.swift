//
//  Constants.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 5.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import Foundation

class Constants {
    
    static let shared = Constants()
    
    var materialList: [Material] = []
    
    func getMaterials() ->[Material] {
        return materialList
    }
}

struct Keys {
    
    static let APIKEY = "lkhdpıy2etry8r623498ory3g2ıuh4234"
    
}

