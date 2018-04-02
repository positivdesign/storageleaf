//
//  ViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 1.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var saveMaterialButton: UIButton!
    @IBOutlet weak var RemoveMaterialButton: UIButton!
    @IBOutlet weak var listMaterialButton: UIButton!
    
    
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        
        preparesaveMaterialButton()
        prepareRemoveMaterialButton()
        preparelistMaterialButton()
     
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    fileprivate func prepareRemoveMaterialButton(){
        RemoveMaterialButton.addTarget(self, action: #selector(RemoveMaterialButtonAction), for: .touchUpInside)
    }
    
    fileprivate func preparesaveMaterialButton(){
        saveMaterialButton.addTarget(self, action: #selector(saveMaterialButtonAction), for: .touchUpInside)
    }
        
    fileprivate func preparelistMaterialButton(){
        listMaterialButton.addTarget(self, action: #selector(listMaterialButtonAction), for: .touchUpInside)
        }
        
    
    
    @objc func RemoveMaterialButtonAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let removeMaterialView = storyboard.instantiateViewController(withIdentifier: "DeleteMaterialViewController") as! DeleteMaterialViewController
        navigationController?.pushViewController(removeMaterialView, animated: true)
        
    }
    
    
    @objc func listMaterialButtonAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let listMaterialView = storyboard.instantiateViewController(withIdentifier: "ReportMaterialViewController") as! ReportMaterialViewController
        navigationController?.pushViewController(listMaterialView, animated: true)
        
    }
    
    
    

    @objc func saveMaterialButtonAction() {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let saveMaterialView = storyboard.instantiateViewController(withIdentifier: "SaveMaterialViewController") as! SaveMaterialViewController
        navigationController?.pushViewController(saveMaterialView, animated: true)
       
    }
    
    
}

