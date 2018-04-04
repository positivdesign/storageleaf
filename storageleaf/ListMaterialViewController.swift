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

        
        
        
        ref = Database.database().reference()

        
    
        let childRef = Database.database().reference(withPath: "material")
    
        
//
        // READ DENEME
        childRef.observe(.value, with: { fireBaseData in
            
        let fireBasePostData = fireBaseData.value as? [String: AnyObject] ?? [:]
        print(fireBasePostData)

        let snapshotValue = fireBaseData.value as! NSDictionary
            
            
            for item in snapshotValue {
                let val = item.value as! NSDictionary
                let matID = val["materialID"] as! String
                let matNum = val["materialNumber"] as! String
                let matResp = val["materialResponsibleID"] as! String
                let matStor = val["storageArea"] as! String

                let newItem = Material(matID, matResp, matStor, matNum, materialImage: UIImage(named:"leaf"))
                
//                if !(ListMaterialViewController.materialArray.index(where: { $0 === newItem }) != nil) {
                    ListMaterialViewController.materialArray.append(newItem)
//                }
            }
            
            self.tableView.reloadData()
        })
        
        prepareTableView()
        ListMaterialViewController.prepareMatearialList()
       
        

    }
    
    fileprivate func prepareTableView (){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MaterialTableViewCell", bundle: nil), forCellReuseIdentifier: "MaterialTableViewCell")
    }
    
    static func prepareMatearialList () {
//        let material1 = Material ( "GC46-BRAKET-06", "AATMACA1", "RA2" , "USED" , materialImage: UIImage(named:"leaf")!)
//        let material2 = Material ( "GC46-BRAKET-05", "AAYYILDIZ", "RA1" , "NEW" , materialImage: UIImage(named:"leaf")!)
        
    
//        ListMaterialViewController.materialArray =[newIte]
        
  
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return ListMaterialViewController.materialArray.count
    }
}

