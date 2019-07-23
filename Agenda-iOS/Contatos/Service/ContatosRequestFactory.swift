//
//  ContatosRequestFactory.swift
//  Agenda-iOS
//
//  Created by administrador on 23/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import Alamofire

class ContatosRequestFactory {
    
    static func getContatos() ->DataRequest {
        
        return Alamofire.request(baseUrl + "/contacts", method: .get, headers: SessionControl.headers)
    }
}
