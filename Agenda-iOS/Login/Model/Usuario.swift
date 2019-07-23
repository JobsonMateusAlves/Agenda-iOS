//
//  Usuario.swift
//  Agenda-iOS
//
//  Created by administrador on 19/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import RealmSwift
import ObjectMapper

class Usuario: Object, Mappable {
    
    var id = RealmOptional<Int>()
    var allowPasswordChange = RealmOptional<Bool>()
    
    @objc dynamic var provider: String?
    @objc dynamic var uid: String?
    @objc dynamic var name: String?
    @objc dynamic var nickname: String?
    @objc dynamic var image: String?
    @objc dynamic var email: String?
    @objc dynamic var token: String?
    @objc dynamic var client: String?
    
    required convenience init?(map: Map) {
        self.init()
    }
    
    override static func primaryKey() -> String? {
        
        return "id"
    }
    
    func mapping(map: Map) {

        
        self.id.value                       <- map["id"]
        self.allowPasswordChange.value      <- map["allow_password_change"]
        self.provider                       <- map["provider"]
        self.uid                            <- map["uid"]
        self.name                           <- map["name"]
        self.nickname                       <- map["nickname"]
        self.image                          <- map["image"]
        self.email                          <- map["email"]
    }
}
