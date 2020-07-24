//
//  PersonBO.swift
//  IOSTrainingVer1
//
//  Created by Trung Nguyen on 7/13/20.
//  Copyright © 2020 Trung Nguyen. All rights reserved.
//

import Foundation
import ObjectMapper

enum PersonStatus: String {
    case Intern = "Intern"
    case Junior = "Junior"
    case Senior = "Senior"
}

class EmployeeBO: Mappable {
    var employees = [PersonBO]()
    required init?(map: Map) {

       }
    
    func mapping(map: Map) {
        employees <- map["employees"]
    }
}

class PersonBO: Mappable {
    var id: String?
    var createdAt: String?
    var name: String?
    var avatar: String?
    var address: String?
    var isMale: Bool?
    var dayWorking: Int = 0 {
        didSet {
            if dayWorking < 60 {
                self.level = .Intern
            }else if dayWorking < 200 {
                self.level = .Junior
            }else {
                self.level = .Senior
            }
        }
    }
    var level: PersonStatus?
    
    required init?(map: Map) {

       }
    
    func mapping(map: Map) {
        id <- map["id"]
        createdAt <- map["createdAt"]
        name <- map["name"]
        avatar <- map["avatar"]
        address <- map["address"]
        isMale <- map["isMale"]
        dayWorking <- map["dayWorking"]
    }
}
