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
    
    var materialArray: [Material] = []
    
    var ref: DatabaseReference!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        prepareMatearialList()
        
        prepareTableView()

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
        
        ref = Database.database().reference()
        
        let childRef = Database.database().reference(withPath: "material")
        
        childRef.observe(.value, with: { fireBaseData in
            
        let snapshotValue = fireBaseData.value as! NSDictionary
            
//            print(snapshotValue)
        self.ref.observe(.value, with: { denemeData in
            
//            print(denemeData.key)
            
            let snapshotValue2 = denemeData.value as! NSDictionary
            
            for abc in snapshotValue2 {
                print(denemeData.children())

//                let val2 = abc.value as! NSDictionary
//                let asd = val2.key as! String
//                print(val2)
//                val2.count
            }
            }
            )
        
        for item in snapshotValue {
            
            let val = item.value as! NSDictionary
            let matID = val["materialID"] as! String
            let matNum = val["materialNumber"] as! String
            let matResp = val["materialResponsibleID"] as! String
            let matStor = val["storageArea"] as! String
//            print(val)
            
            let postID = "-L9G8P9_u-zS3lycwx30"
            
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
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            
           
            materialArray.remove(at: indexPath.row) //Remove the selected name from array used in TableView that is displayed in cell
            
            tableView.deleteRows(at: [indexPath], with: .fade) // TableView Animation
            
            Database.database().reference().child("material").child(materialArray[indexPath.row].postID!).removeValue()
            materialArray.remove(at: indexPath.row) // removing selected if from id array locally
            

            
            self.tableView.reloadData()
            
        }
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialArray.count
    }
}

