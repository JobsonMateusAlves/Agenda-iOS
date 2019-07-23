//
//  SessionControl.swift
//  Agenda-iOS
//
//  Created by administrador on 22/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation

class SessionControl {
    
    static var headers: [String : String] = [:]
    
    static var user: Usuario? {
        return uiRealm.objects(Usuario.self).first
    }
    
    static var isSessionActive: Bool {
        
        if let user = self.user {
            return true
        }
        return false
    }
    
    static func setHeaders() {
        
        if let user = self.user {
            
            if let token = user.token {
                self.headers["Access-Token"] = token
            }
            
            if let client = user.client {
                self.headers["Client"] = client
            }
            
            if let uid = user.uid {
                self.headers["Uid"] = uid
            }
            print(self.headers["Access-Token"] ?? "-")
            print(self.headers["Client"] ?? "-")
            print(self.headers["Uid"] ?? "-")
        }
    }
}
