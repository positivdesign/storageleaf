//
//  Material.swift
//  storageleaf
//
//  Created by Nergis Yıldız Atmaca on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit

class Material {
    
    var malzemeID: String
    var malzemeOwnerID: String
    var malzemeStokID: String
    var comment: String
    var materialImage: UIImage?
    
    init (_ malzemeID: String, _ malzemeOwnerID: String, _ malzemeStokID: String, _ comment: String, materialImage: UIImage?) {
        
        self.malzemeID = malzemeID
        self.malzemeOwnerID = malzemeOwnerID
        self.malzemeStokID = malzemeStokID
        self.comment = comment
        self.materialImage = materialImage
    }
    
    
}
