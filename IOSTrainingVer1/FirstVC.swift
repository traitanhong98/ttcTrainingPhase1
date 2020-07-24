//
//  FirstVC.swift
//  IOSTrainingVer1
//
//  Created by Trung Nguyen on 7/11/20.
//  Copyright © 2020 Trung Nguyen. All rights reserved.
//

import UIKit

class FirstVC: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var timer = Timer()
    
    var listPerson = [PersonBO]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
        tableView.register(UINib(nibName: "PersonInfoCell", bundle: nil), forCellReuseIdentifier: "PersonInfoCell")
        NetworkLayer.callAPI(type: EmployeeBO.self) { obj in
            self.listPerson = obj.employees
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
}

extension FirstVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return listPerson.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "PersonInfoCell", for: indexPath) as? PersonInfoCell
        cell?.configCell(listPerson[indexPath.row])
        cell?.didEditInfo = {
            let editVC = EditInfoVC()
            editVC.person = self.listPerson[indexPath.row]
            editVC.delegate = self
            self.present(editVC, animated: true, completion: nil)
        }
        
        cell?.didDelete = {
            let alert = UIAlertController(title: "Xoá?", message: "Bạn có muốn xoá nhân viên không?", preferredStyle: UIAlertController.Style.alert)
            alert.addAction(UIAlertAction(title: "Có", style: UIAlertAction.Style.default, handler: { action in
                self.listPerson.remove(at: indexPath.row)
                self.tableView.reloadData()
            }))
            
            alert.addAction(UIAlertAction(title: "Không", style: UIAlertAction.Style.cancel, handler: nil))
            self.present(alert, animated: true, completion: nil)
        }
        
        return cell!
    }
}

extension FirstVC: EditInfoVCDelegate {
    func didChangeInfo(_ infoVC: EditInfoVC, person: PersonBO?) {
        for (index, item) in self.listPerson.enumerated() {
            if let id = item.id, id == person?.id {
                self.listPerson[index] = person!
                self.tableView.reloadData()
            }
        }
    }
}
