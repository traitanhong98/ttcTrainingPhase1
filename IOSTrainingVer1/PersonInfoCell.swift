//
//  PersonInfoCell.swift
//  IOSTrainingVer1
//
//  Created by Trung Nguyen on 7/13/20.
//  Copyright © 2020 Trung Nguyen. All rights reserved.
//

import UIKit

class PersonInfoCell: UITableViewCell {
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblAddress: UILabel!
    @IBOutlet weak var lblGender: UILabel!
    @IBOutlet weak var lblLevel: UILabel!
    
    var didEditInfo: (() -> Void)?
    var didDelete: (() -> Void)?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configCell(_ data: PersonBO) {
        self.lblName.text = data.name
        self.lblAddress.text = data.address
        self.lblGender.text = data.isMale ?? false ?  "Nam" : "Nữ"
        self.lblLevel.text = data.level?.rawValue
    }
    
    @IBAction func changeInfoAction(_ sender: Any) {
        if let edit = didEditInfo {
            edit()
        }
    }
    
    
    @IBAction func deleteAction(_ sender: Any) {
        if let delete = didDelete {
            delete()
        }
    }
    
}
