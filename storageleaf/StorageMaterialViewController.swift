//
//  StorageMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit
import FirebaseDatabase


class StorageMaterialViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var materialArray: [Material] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareTableView()
        
        prepareMatearialList()
        
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        materialArray = []
    }
    
    fileprivate func prepareTableView (){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MaterialTableViewCell", bundle: nil), forCellReuseIdentifier: "MaterialTableViewCell")
    }
    
    fileprivate func prepareMatearialList () {
        
        let childRef = Database.database().reference(withPath: "material")
        
        childRef.observe(.value, with: { fireBaseData in
            
            let snapshotValue = fireBaseData.value as! NSDictionary
            
            
            for item in snapshotValue {
                
                let val = item.value as! NSDictionary
                let matID = val["materialID"] as! String
                let matNum = val["materialNumber"] as! String
                let matResp = val["materialResponsibleID"] as! String
                let matStor = val["storageArea"] as! String
                
                let postID = "-L9GL1BLO7xSblrJj0Go"
                
                let newItem = Material(matID, matResp, matStor, matNum, postID, materialImage: UIImage(named:"leaf"))
                
                self.materialArray.append(newItem)
                
                self.tableView.reloadData()
                
            }
            
        } )
        
    }


    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

extension StorageMaterialViewController: UITableViewDelegate, UITableViewDataSource {
    
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
        let materialAtIndex = materialArray[indexPath.row]
        
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
        return materialArray.count
    }
}

