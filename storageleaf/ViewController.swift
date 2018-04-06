//
//  ViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 1.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import Material
class ViewController: UIViewController {

    @IBOutlet weak var saveMaterialButton: FlatButton!
    @IBOutlet weak var RemoveMaterialButton: FlatButton!
  
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
     
        
        preparesaveMaterialButton()
        prepareRemoveMaterialButton()
        prepareNavigatorBar()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func prepareRemoveMaterialButton(){
        
        RemoveMaterialButton.cornerRadiusPreset = .cornerRadius4
        RemoveMaterialButton.pulseColor = .white
        RemoveMaterialButton.depthPreset = .depth4
        RemoveMaterialButton.backgroundColor = SLColor.primary
        RemoveMaterialButton.addTarget(self, action: #selector(RemoveMaterialButtonAction), for: .touchUpInside)
    }
    
    fileprivate func preparesaveMaterialButton(){
        
        saveMaterialButton.cornerRadiusPreset = .cornerRadius4
        saveMaterialButton.pulseColor = .white
        saveMaterialButton.depthPreset = .depth4
        saveMaterialButton.backgroundColor = SLColor.primary
        saveMaterialButton.addTarget(self, action: #selector(saveMaterialButtonAction), for: .touchUpInside)
    }
        
   
    
    fileprivate func prepareNavigatorBar() {
        navigationItem.title = "StorageLeaf"
        navigationController?.navigationBar.tintColor = SLColor.barTintColor
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.barTintColor = SLColor.barColor
    }
        
    
    
    @objc func RemoveMaterialButtonAction() {
    
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let removeMaterialView = storyboard.instantiateViewController(withIdentifier: "DeleteMaterialViewController") as! DeleteMaterialViewController
        navigationController?.pushViewController(removeMaterialView, animated: true)
        
    }
    
    

    
    
    

    @objc func saveMaterialButtonAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let saveMaterialView = storyboard.instantiateViewController(withIdentifier: "SaveMaterialViewController") as! SaveMaterialViewController
        navigationController?.pushViewController(saveMaterialView, animated: true)
       
    }
    
 
    
}

