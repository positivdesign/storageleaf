//
//  Material.swift
//  storageleaf
//
//  Created by Nergis Yıldız Atmaca on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import ObjectMapper
    


class Material {
    
    var malzemeID: String?
    var malzemeOwnerID: String?
    var malzemeStokID: String?
    var materialNumber: String?
    var postID: String?
    var materialImage: UIImage?
    
    init (_ malzemeID: String, _ malzemeOwnerID: String, _ malzemeStokID: String, _ materialNumber: String, _ postID: String, materialImage: UIImage?) {
        
        self.malzemeID = malzemeID
        self.malzemeOwnerID = malzemeOwnerID
        self.malzemeStokID = malzemeStokID
        self.materialNumber = materialNumber
        self.materialImage = materialImage
        self.postID = postID
    }
    
    
}
