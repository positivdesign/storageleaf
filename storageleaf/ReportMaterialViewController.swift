//
//  ReportMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit

class ReportMaterialViewController: UIViewController, UIPickerViewDataSource,UIPickerViewDelegate  {
    
    @IBOutlet weak var reportResponsibleID: UITextField!
    
    @IBOutlet weak var reportMaterialNumber: UITextField!
    
    @IBOutlet weak var reportMaterialID: UITextField!
    
    @IBOutlet weak var reportStorageArea: UIPickerView!
    
    

    @IBOutlet weak var reportMaterailReportButton: UIButton!
    

    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        reportStorageArea.delegate = self
        reportStorageArea.dataSource = self
        
        prepareReportMaterialReport() ///Button geçişi
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func reportMaterialReportButtonAction(_ sender: Any) {
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
 
    /////////////////////////////////////Button Sayfalar arası geçiş///////////////////////
    
 
  fileprivate func prepareReportMaterialReport(){
        reportMaterailReportButton.addTarget(self, action: #selector(prepareReportMaterialReportAction),   for: .touchUpInside)
    }
    @objc func prepareReportMaterialReportAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let StorageListView = storyboard.instantiateViewController(withIdentifier: "StorageMaterialViewController") as! StorageMaterialViewController
        navigationController?.pushViewController(StorageListView, animated: true)
        
    }
    /////////////////////////////////////////////////////////////////
    
    }
