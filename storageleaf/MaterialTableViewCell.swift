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
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
