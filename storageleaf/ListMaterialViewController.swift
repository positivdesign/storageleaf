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
    }
    
    fileprivate func prepareTableView (){
        tableView.delegate = self as? UITableViewDelegate
        tableView.dataSource = self as? UITableViewDataSource
        tableView.register(UINib(nibName: "MaterialTableViewCell", bundle: nil), forCellReuseIdentifier: "MaterialTableViewCell")
    }
    
    fileprivate func prepareMatearialList () {
        let material1 = Material ( "GC46-BRAKET-01", "AATMACA1", "ARKA BAHÇE" , "PASLANMIŞ" , materialImage: nil)
        let material2 = Material ( "GC46-BRAKET-02", "AAYYILDIZ", "ON BAHÇE" , "CİLLOP" , materialImage: nil)
        materialArray = [material1, material2]
    }
    
    fileprivate func prepareNavigatorBar() {
        navigationItem.title = "Malzeme Listesi"
        navigationController?.navigationBar.tintColor = .white
        navigationController?.navigationBar.barStyle = .blackTranslucent
        navigationController?.navigationBar.barTintColor = .green
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
