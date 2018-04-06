//
//  SLSearchView.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 6.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import Material

class SLSearchView: NibView {

    
    @IBOutlet weak var deleteResponsibleID: TextField!
    
    @IBOutlet weak var deleteMaterialNumber: TextField!
    
    @IBOutlet weak var deleteMaterialID: TextField!
    
   //@IBOutlet weak var deleteMaterialSearchButton: UIButton!
    
    @IBOutlet weak var switchDeleteSearchButton: UISwitch!
    
    @IBOutlet weak var pickerDeleteMaterial: UIPickerView!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        prepareTextFields()
        pickerDeleteIsHidden()
        
    }
    
    fileprivate func prepareTextFields() {
        
        deleteResponsibleID.placeholder = "Malzeme Sorumlusu"
        deleteMaterialID.placeholder = "Malzeme ID"
        deleteMaterialNumber.placeholder = "Malzeme Numarası"
        
        deleteResponsibleID.dividerActiveColor = SLColor.primary
        deleteMaterialID.dividerActiveColor = SLColor.primary
        deleteMaterialNumber.dividerActiveColor = SLColor.primary
        
        deleteResponsibleID.placeholderActiveColor = SLColor.primary
        deleteMaterialID.placeholderActiveColor = SLColor.primary
        deleteMaterialNumber.placeholderActiveColor = SLColor.primary
    }
    
    
    func pickerDeleteIsHidden(){
      pickerDeleteMaterial.isHidden = true
    }
    
    @IBAction func pickerDeleteMaterialAction(_ sender: Any) {
        
        if switchDeleteSearchButton.isOn {
            
            pickerDeleteMaterial.isHidden = false
        }
        else {
            
            pickerDeleteMaterial.isHidden = true
        }
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
