//
//  MaterialTableViewCell.swift
//  storageleaf
//
//  Created by Nergis Yıldız Atmaca on 2.04.2018.
//  Copyright © 2018 AYDIN AYYILDIZ. All rights reserved.
//

import UIKit

class MaterialTableViewCell: UITableViewCell {


    @IBOutlet weak var materialImageView: UIImageView!
    
    @IBOutlet weak var malzemeIDLabel: UILabel!
    
    @IBOutlet weak var malzemeOwnerIDLabel: UILabel!
    
    @IBOutlet weak var malzemeStokAreaLabel: UILabel!
    
    @IBOutlet weak var commentLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        preparematerialImageView()
    }
    
    fileprivate func preparematerialImageView() {
        materialImageView.contentMode = .scaleAspectFit
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
