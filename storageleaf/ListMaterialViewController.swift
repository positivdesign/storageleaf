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
    
//    tablo elemanlarını sayfadan çıkınca sıfırlamak için
    
    override func viewWillDisappear(_ animated: Bool) {
        materialArray = []
    }
    
    
    
    fileprivate func prepareTableView (){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MaterialTableViewCell", bundle: nil), forCellReuseIdentifier: "MaterialTableViewCell")
    }
    
    fileprivate func prepareMatearialList () {
        
        materialArray = []
        
//        firebase üzerinden post data çekiliyor
        
        ref = Database.database().reference()
        
        let childRef = Database.database().reference(withPath: "material")
        
        childRef.observe(.value, with: { fireBaseData in
            
        let snapshotValue = fireBaseData.value as! NSDictionary // nsdictionary denilince daha düzenli bir yapıda getiriyor.
            
        
//             gelen her bir dizi elemanını atma yapıyor.
        for item in snapshotValue {
            let postID = item.key as! String
            let val = item.value as! NSDictionary
            let matID = val["materialID"] as! String
            let matNum = val["materialNumber"] as! String
            let matResp = val["materialResponsibleID"] as! String
            let matStor = val["storageArea"] as! String
//            print(item)
            
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
//    sola kaydır sil ekranı burası
    
    func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        print(materialArray[indexPath.row].postID ?? "naber")
        let abc = indexPath.row
        print(abc)
        if editingStyle == .delete {
            
            Database.database().reference().child("material").child(materialArray[indexPath.row].postID!).removeValue()
            
            materialArray.remove(at: indexPath.row) // removing selected if from id array locally
            
            print(materialArray[indexPath.row].postID ?? "burda")
            
//            print(materialArray[abc])
            
            tableView.deleteRows(at: [indexPath], with:  UITableViewRowAnimation.automatic) // TableView Animation
            
//           Database.database().reference().child("material").child(materialArray[indexPath.row].postID!).removeValue()
            
            materialArray = []
//
//            self.tableView.reloadData()

            
        }
    }
    
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialArray.count
    }
}

