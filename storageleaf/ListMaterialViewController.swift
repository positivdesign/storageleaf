//
//  ListMaterialViewController.swift
//  storageleaf
//
//  Created by AYDIN AYYILDIZ on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit


class ListMaterialViewController: UIViewController {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var materialArray: [Material] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        prepareTableView()
        prepareMatearialList()
        prepareNavigatorBar()
    }
    
    fileprivate func prepareTableView (){
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "MaterialTableViewCell", bundle: nil), forCellReuseIdentifier: "MaterialTableViewCell")
    }
    
    fileprivate func prepareMatearialList () {
        let material1 = Material ( "GC46-BRAKET-06", "AATMACA1", "RA2" , "USED" , materialImage: UIImage(named:"leaf")!)
        let material2 = Material ( "GC46-BRAKET-05", "AAYYILDIZ", "RA1" , "NEW" , materialImage: UIImage(named:"leaf")!)
        materialArray = [material1, material2, material1]
    }
    
    fileprivate func prepareNavigatorBar() {
        navigationItem.title = "Malzeme Listesi"
        navigationController?.navigationBar.tintColor = .black
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.barTintColor = .green
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
        cell.commentLabel.text = materialAtIndex.comment
        
        return cell
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return materialArray.count
    }
}



