//
//  EditInfoVC.swift
//  IOSTrainingVer1
//
//  Created by Trung Nguyen on 7/14/20.
//  Copyright © 2020 Trung Nguyen. All rights reserved.
//

import UIKit

protocol EditInfoVCDelegate {
    func didChangeInfo(_ infoVC: EditInfoVC, person: PersonBO?)
}

class EditInfoVC: UIViewController {
    
    @IBOutlet weak var tfName: UITextField!
    @IBOutlet weak var tfAddress: UITextField!
    @IBOutlet weak var switchGender: UISwitch!
    
    var person: PersonBO?
    var delegate: EditInfoVCDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        tfName.text = person?.name
        tfAddress.text = person?.address
        switchGender.isOn = person?.isMale ?? false
    }
    
    @IBAction func backAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    @IBAction func changeAction(_ sender: Any) {
        self.dismiss(animated: true) {
            if let del = self.delegate {
                let newPerson = self.person
                newPerson?.name = self.tfName.text
                newPerson?.address = self.tfAddress.text
                newPerson?.isMale = self.switchGender.isOn
                
                del.didChangeInfo(self, person: newPerson)
            }
        }
    }
    
}
