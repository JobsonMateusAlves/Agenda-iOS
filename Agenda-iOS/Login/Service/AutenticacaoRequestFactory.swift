//
//  AutenticacaoRequestFatory.swift
//  Agenda-iOS
//
//  Created by administrador on 19/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import Alamofire

class AutenticacaoRequestFactory {
    
    static func postCadastro(email: String, senha: String, confirmacaoSenha: String) -> DataRequest {
        
        let cadastro = [
                            "email": email,
                            "password": senha,
                            "password_confirmation": confirmacaoSenha
                       ]
        
        return Alamofire.request(baseUrl + "/auth", method: .post, parameters: cadastro, encoding: JSONEncoding.default)
    }
    
    static func postLogin(email: String, senha: String) -> DataRequest {
        
        let login = [
                        "email": email,
                        "password": senha
                    ]
        
        return Alamofire.request(baseUrl + "/auth/sign_in", method: .post, parameters: login, encoding: JSONEncoding.default)
    }
}
