//
//  Contato.swift
//  Agenda-iOS
//
//  Created by administrador on 23/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Contato: Object, Mappable {
    
    var id = RealmOptional<Int>()
    @objc dynamic var name: String?
    @objc dynamic var email: String?
    @objc dynamic var phone: String?
    @objc dynamic var picture: String?
    var birth = RealmOptional<Double>()
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        return "id"
    }
    
    func mapping(map: Map) {
        
        self.id.value               <- map["id"]
        self.name                   <- map["name"]
        self.email                  <- map["email"]
        self.phone                  <- map["phone"]
        self.picture                <- map["picture"]
        self.birth.value            <- map["birth"]
    }
}
