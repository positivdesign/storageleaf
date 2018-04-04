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
      var ref: DatabaseReference!
    
    
    @IBOutlet weak var tableView: UITableView!
    
   static var materialArray: [Material] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        //firebase reference
        ref = Database.database().reference()
        prepareTableView()
        ListMaterialViewController.prepareMatearialList()
    

    }
    
    fileprivate func prepareTableView (){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MaterialTableViewCell", bundle: nil), forCellReuseIdentifier: "MaterialTableViewCell")
    }
    
    static func prepareMatearialList () {
        let material1 = Material ( "GC46-BRAKET-05", "AATMACA1", "RA2" , "USED")
      // let material2 = Material ( "GC46-BRAKET-05", "AAYYILDIZ", "RA1" , "NEW" , materialImage: UIImage(named:"leaf")!)
      // let material3 = Material(, <#T##malzemeOwnerID: String##String#>, <#T##malzemeStokID: String##String#>, <#T##materialNumber: String##String#>, materialImage: <#T##UIImage?#>)
    

        
          ListMaterialViewController.materialArray = [material1]
        
//        if let searchResponse2 = response.result.value {// response sonuçlarını al
//            // guard let movies = self.plotLabel else {
//            //                   // self.movieArray.removeAll()
//            self.plotLabel.text = searchResponse2.plot //plotlabel textini search response.plotuna eşitle
//            self.directorLabel.text = searchResponse2.director//asenkron fonksiyonların içine self yazılması gerekiyor.
//            return
        
      
        
        
       
        
  
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
