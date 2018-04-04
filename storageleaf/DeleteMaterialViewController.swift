//
//  DeleteMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import FirebaseDatabase

class DeleteMaterialViewController: UIViewController {
    
    var ref: DatabaseReference!
    
    @IBOutlet weak var deleteResponsibleID: UITextField!
    
    @IBOutlet weak var deleteMaterialNumber: UITextField!
    
    @IBOutlet weak var deleteMaterialID: UITextField!
    
    @IBOutlet weak var deleteMaterialSearchButton: UIButton!
    
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //firebase reference
        ref = Database.database().reference()

        preparedeleteMaterialSearchButton()
    
    
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func deleteMaterialSearchButtonAction(_ sender: Any) {
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
