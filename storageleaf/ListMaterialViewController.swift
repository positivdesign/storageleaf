//
//  ListMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import FirebaseDatabase


class ListMaterialViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!


    
    static var materialArray: [Material] = []
    

    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        prepareMatearialList()
        prepareTableView()

        
    }
    override func viewDidDisappear(_ animated: Bool) {
        ListMaterialViewController.materialArray = []
    }

    fileprivate func prepareTableView (){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MaterialTableViewCell", bundle: nil), forCellReuseIdentifier: "MaterialTableViewCell")
        tableView.tableFooterView = UIView()
    }
    
    
    //firebaseden data çekme
    fileprivate func prepareMatearialList () {
        
//        firebase üzerinden post data çekiliyor
        
        ref = Database.database().reference()
        
        let childRef = Database.database().reference(withPath: "material")
        
        childRef.observe(.value, with: { fireBaseData in
            

        let snapshotValue = fireBaseData.value as? NSDictionary ?? [:] // nsdictionary denilince daha düzenli bir yapıda getiriyor.
            

        for item in snapshotValue {
            let postID = item.key as! String
            let val = item.value as! NSDictionary
            let matID = val["materialID"] as! String
            let matNum = val["materialNumber"] as! String
            let matResp = val["materialResponsibleID"] as! String
            let matStor = val["storageArea"] as! String

            // TODO: FIX ME
            
            if DeleteMaterialViewController.materialIDText == matID ||
                DeleteMaterialViewController.resIDText == matResp ||
            DeleteMaterialViewController.materialNumberText == matNum ||
        DeleteMaterialViewController.materialStorageText == matStor {
                
                let newItem = Material(matID, matResp, matStor, matNum, postID, materialImage: UIImage(named:"storage"))
                
                var found = false
                for material in ListMaterialViewController.materialArray {
                    if material.postID == newItem.postID {
                        found = true
                        break
                    }
                }
                if !found {
                    
                    //Constants.shared.getMaterials()
                    ListMaterialViewController.materialArray.append(newItem)
                }
                
                self.tableView.reloadData()
                
            }
            
            if DeleteMaterialViewController.materialIDText == "" &&
                DeleteMaterialViewController.resIDText == "" &&
                DeleteMaterialViewController.materialNumberText == "" &&
                DeleteMaterialViewController.materialStorageText == "" {
                
                let newItem = Material(matID, matResp, matStor, matNum, postID, materialImage: UIImage(named:"storage"))
                
                var found = false
                for material in ListMaterialViewController.materialArray {
                    if material.postID == newItem.postID {
                        found = true
                        break
                    }
                }
                if !found {
                    
                   // Constants.shared.getMaterials()
                    ListMaterialViewController.materialArray.append(newItem)
                }
                
                self.tableView.reloadData()
                
            }
            
        }
        } )
    }
    
 
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension ListMaterialViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("You tapped cell number \(indexPath.row).")
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 128
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell: MaterialTableViewCell = tableView.dequeueReusableCell(withIdentifier: "MaterialTableViewCell") as? MaterialTableViewCell else {
            return UITableViewCell()
        }
        let materialAtIndex = ListMaterialViewController.materialArray[indexPath.row]
        
        if let malzemeResmi = materialAtIndex.materialImage {
            cell.materialImageView.image = malzemeResmi
        }
        
        cell.malzemeIDLabel.text = materialAtIndex.malzemeID
        cell.malzemeOwnerIDLabel.text = materialAtIndex.malzemeOwnerID
        cell.malzemeStokAreaLabel.text = materialAtIndex.malzemeStokID
        cell.commentLabel.text = materialAtIndex.materialNumber
        
        return cell
        
    }
//    sola kaydır sil ekranı burası
    

    func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
    
    func tableView(_ tableView: UITableView, editActionsForRowAt indexPath: IndexPath) -> [UITableViewRowAction]? {
        let deleteAction = UITableViewRowAction(style: .destructive, title: "SİL", handler: { action, indexPath in
        Database.database().reference().child("material").child(ListMaterialViewController.materialArray[indexPath.row].postID!).removeValue()
            
            ListMaterialViewController.materialArray.remove(at: indexPath.row) // removing selected if from id array locally
            tableView.reloadData()
        })
        
//        let editAction = UITableViewRowAction(style: .normal, title: "edit", handler: { action, indexPath in
//            print("EDİT")
//        })
        
        return [deleteAction]
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListMaterialViewController.materialArray.count
    }
}
