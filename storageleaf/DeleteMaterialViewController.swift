//
//  DeleteMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DeleteMaterialViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    var ref: DatabaseReference!
    
    static var resIDText: String?
    static var materialNumberText: String?
    static var materialIDText: String?
    
    
    @IBOutlet weak var deleteResponsibleID: UITextField!
    
    @IBOutlet weak var deleteMaterialNumber: UITextField!
    
    @IBOutlet weak var deleteMaterialID: UITextField!
    
    @IBOutlet weak var deleteMaterialSearchButton: UIButton!
    
    @IBOutlet weak var switchDeleteSearchButton: UISwitch!
    
    @IBOutlet weak var pickerDeleteMaterial: UIPickerView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        

        
        
        pickerDeleteMaterial.delegate = self
        pickerDeleteMaterial.dataSource = self
        
        pickerDeleteIsHidden()
        
        //firebase reference
        ref = Database.database().reference()

        preparedeleteMaterialSearchButton()
        
   
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    @IBAction func pickerDeleteMaterialAction(_ sender: Any) {
        
        if switchDeleteSearchButton.isOn {
            
            pickerDeleteMaterial.isHidden = false
            
        }else {
            
            pickerDeleteMaterial.isHidden = true
        }
        
    }
    
    
    func pickerDeleteIsHidden(){
         pickerDeleteMaterial.isHidden = true
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
    
    
    
    @IBAction func deleteMaterialSearchButtonAction(_ sender: Any) {
        
        DeleteMaterialViewController.materialIDText = deleteMaterialID.text
        DeleteMaterialViewController.materialNumberText = deleteMaterialNumber.text
        DeleteMaterialViewController.resIDText = deleteResponsibleID.text
        
        print(DeleteMaterialViewController.materialIDText,DeleteMaterialViewController.materialNumberText,DeleteMaterialViewController.resIDText )
    }
    
     /////////////////////////////////////Button Sayfalar arası geçiş///////////////////////
    
    fileprivate func preparedeleteMaterialSearchButton(){
        deleteMaterialSearchButton.addTarget(self, action: #selector(preparedeleteMaterialSearchButtonAction), for: .touchUpInside)
    }
   
    @objc func preparedeleteMaterialSearchButtonAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listMaterialView = storyboard.instantiateViewController(withIdentifier: "ListMaterialViewController") as! ListMaterialViewController
        navigationController?.pushViewController(listMaterialView, animated: true)
        
    }
 ////////////////////////////////////////////////////////////////////////////////////////////
    
    
    
}
