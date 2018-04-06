//
//  saveMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import FirebaseDatabase

class SaveMaterialViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate   {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var saveMaterialRespID: UITextField!
    
    @IBOutlet weak var saveMaterialNumber: UITextField!
    
    @IBOutlet weak var saveMaterialID: UITextField!
    
    @IBOutlet weak var saveStorageArea: UIPickerView!
    
    @IBOutlet weak var saveMaterialSaveButton: UIButton!
    
    static let storageAreNames = ["RA1","RA2","RA3","RA4","RB1","RB2","RB3","RB4"]
    var fireBaseList = ["saveMaterialRespID", "saveMaterialNumber","saveMaterialID","saveStorageArea"]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        ref = Database.database().reference()
        saveStorageArea.delegate = self
        saveStorageArea.dataSource = self

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()

    }
    


    @IBAction func saveMaterialButtonAction(_ sender: Any) {
        
       /////////////////////////////firebase save///////////////////////////////
     
        
        let name: NSString =  SaveMaterialViewController.storageAreNames[saveStorageArea.selectedRow(inComponent: 0)] as NSString
 
        
        ref?.child("material").childByAutoId().setValue(["materialResponsibleID": saveMaterialRespID.text, "materialNumber": saveMaterialNumber.text, "materialID": saveMaterialID.text, "storageArea": name], withCompletionBlock: { (error, ref) in
            if error == nil {
                print("success")
                
                self.saveMaterialRespID.text = ""
                self.saveMaterialNumber.text = ""
                self.saveMaterialID.text = ""
                
            } else {
                print("failure")
            }
        })
    }
       
///////////////////////////////////////////////////////////////////////////////////
//        waljfsdhfadkshfb

    
    
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
     let selectedValue = SaveMaterialViewController.storageAreNames[row] as NSString
      print(selectedValue)
    }
  /////////////////////////////////////////////////////////////////
    
}
