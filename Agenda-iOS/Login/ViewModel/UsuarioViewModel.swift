//
//  UsuarioViewModel.swift
//  Agenda-iOS
//
//  Created by administrador on 19/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import RealmSwift

struct UsuarioView {
    
    var email = ""
}

class UsuarioViewModel {
    
    static func save(object: Usuario) {
        
        try? uiRealm.write {
            
            uiRealm.add(object, update: .all)
        }
    }
    
    static func delete() {
        
        if let result = uiRealm.objects(Usuario.self).first {
            
            try? uiRealm.write {
                uiRealm.delete(result)
            }
        }
    }
}
