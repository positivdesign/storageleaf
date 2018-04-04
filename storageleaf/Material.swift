//
//  Material.swift
//  storageleaf
//
//  Created by Nergis Yıldız Atmaca on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import ObjectMapper
    


class Material: Mappable {
    
    var malzemeID: String?
    var malzemeOwnerID: String?
    var malzemeStokID: String?
    var materialNumber: String?
    var materialImage: UIImage?
    
    init (_ malzemeID: String?, _ malzemeOwnerID: String?, _ malzemeStokID: String?, _ materialNumber: String?) {
        
        self.malzemeID = malzemeID
        self.malzemeOwnerID = malzemeOwnerID
        self.malzemeStokID = malzemeStokID
        self.materialNumber = materialNumber
        //self.materialImage = materialImage
    }
    
    required init?(map: Map) {
        
    }
    
    func mapping(map: Map) {
        malzemeID <- map["materialID"]
        malzemeOwnerID <- map["materialResponsibleID"]
        malzemeStokID <- map["storageArea"]
        materialNumber <- map["materialNumber"]
        
    }
    
    
}
