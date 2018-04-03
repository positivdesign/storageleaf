//
//  saveMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit

class SaveMaterialViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate   {
    
    @IBOutlet weak var saveMaterialRespID: UITextField!
    
    @IBOutlet weak var saveMaterialNumber: UITextField!
    
    @IBOutlet weak var saveMaterialID: UITextField!
    
    @IBOutlet weak var saveStorageArea: UIPickerView!
    
    @IBOutlet weak var saveMaterialSaveButton: UIButton!
    
    static let storageAreNames = ["RA1","RA2","RA3","RA4","RB1","RB2","RB3","RB4"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        
        saveStorageArea.delegate = self
        saveStorageArea.dataSource = self
        
        
        
     
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    
    
    

    @IBAction func saveMaterialButtonAction(_ sender: Any) {
        
        
        
    }
    
    
  ///////////////////////////////Picker View İle ilgili
    public func numberOfComponents(in pickerView: UIPickerView) -> Int{
        return 1
    }
   
    public func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int{
        return SaveMaterialViewController.storageAreNames.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return SaveMaterialViewController.storageAreNames[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
    
    }
  /////////////////////////////////////////////////////////////////
    
}
