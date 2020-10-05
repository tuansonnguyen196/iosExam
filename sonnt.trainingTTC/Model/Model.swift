//
//  Model.swift
//  sonnt.trainingTTC
//
//  Created by Nero on 10/2/20.
//  Copyright © 2020 Nero. All rights reserved.
//

import Foundation
import ObjectMapper

class EmployeeBO: Mappable {
    
    var employees = [PersonBO]()
    required init?(map: Map) {
    }
    
     func mapping(map: Map) {
        employees <- map["employees"]
    }
    

}

class PersonBO: Mappable{
    
    var id: String?
    var createdAt: String?
    var name: String?
    var avatar: String?
    var address: String?
    var isMale: Bool?
    var dayWorking: Int = 0{
        didSet {
            if dayWorking < 60 {
                self.level = .intern
            }else if dayWorking < 200 {
                self.level = .junior
            }else {
                self.level = .senior
            }
        }
    }
    var level: Position?
    
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

enum Position: String {
    case intern = "intern"
    case junior = "junior"
    case senior = "senior"
}
