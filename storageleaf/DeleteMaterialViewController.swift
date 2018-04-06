//
//  DeleteMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import FirebaseDatabase
import Material

class DeleteMaterialViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate {
    
    var ref: DatabaseReference!
    
    static var resIDText: String?
    static var materialNumberText: String?
    static var materialIDText: String?
    static var materialStorageText: String?
    
    
//    @IBOutlet weak var deleteResponsibleID: UITextField!
//
//    @IBOutlet weak var deleteMaterialNumber: UITextField!
//
//    @IBOutlet weak var deleteMaterialID: UITextField!
    
    @IBOutlet weak var deleteMaterialSearchButton: FlatButton!
    
//    @IBOutlet weak var switchDeleteSearchButton: UISwitch!
//
    //@IBOutlet weak var pickerDeleteMaterial: UIPickerView!
    
    
    @IBOutlet weak var searchView: SLSearchView!
    
    
    override func viewDidLoad() {
        

        super.viewDidLoad()
        
        prepareButton()
        
        
        searchView.pickerDeleteMaterial.delegate = self
        searchView.pickerDeleteMaterial.dataSource = self
        
        
///picker için default hidden fonksiyonu tanımlandı



        ///firebase reference
        ref = Database.database().reference()

        //sayfalar arası geçiş button
        preparedeleteMaterialSearchButton()
        
   
    
    }
    
    func prepareButton() {
        
        deleteMaterialSearchButton.cornerRadiusPreset = .cornerRadius4
        deleteMaterialSearchButton.pulseColor = .white
        deleteMaterialSearchButton.depthPreset = .depth4
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
        
        DeleteMaterialViewController.materialIDText = searchView.deleteMaterialID.text
        DeleteMaterialViewController.materialNumberText = searchView.deleteMaterialNumber.text
        DeleteMaterialViewController.resIDText = searchView.deleteResponsibleID.text
        
        if searchView.pickerDeleteMaterial.isHidden == true {
            DeleteMaterialViewController.materialStorageText = ""
        } else {
            DeleteMaterialViewController.materialStorageText = SaveMaterialViewController.storageAreNames[searchView.pickerDeleteMaterial.selectedRow(inComponent: 0)]
            
        }
        
        print(DeleteMaterialViewController.materialIDText,DeleteMaterialViewController.materialNumberText,DeleteMaterialViewController.resIDText,DeleteMaterialViewController.materialStorageText )
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
