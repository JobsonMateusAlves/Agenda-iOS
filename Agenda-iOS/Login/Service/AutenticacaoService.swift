//
//  AutenticacaoService.swift
//  Agenda-iOS
//
//  Created by administrador on 19/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol AutenticacaoServiceDelegate {
    
    func success()
    func failure(error: String)
}

class AutenticacaoService {
    
    var delegate: AutenticacaoServiceDelegate!
    
    init(delegate: AutenticacaoServiceDelegate) {
        self.delegate = delegate
    }
    
    func postCadastro(email: String, senha: String, confirmacaoSenha: String) {
        
        AutenticacaoRequestFactory.postCadastro(email: email, senha: senha, confirmacaoSenha: confirmacaoSenha).validate().responseObject(keyPath: "data", completionHandler: { (response: DataResponse<Usuario>) in
            
            switch response.result {
                
            case .success:
                
                if let usuario = response.result.value {
                    
                    if let client = response.response?.allHeaderFields["Client"] as? String,
                        let token = response.response?.allHeaderFields["Access-Token"] as? String,
                        let uid = response.response?.allHeaderFields["Uid"] as? String {
                        
                        usuario.token = token
                        usuario.client = client
                        usuario.uid = uid
                        
                        UsuarioViewModel.save(object: usuario)
                        
                        SessionControl.setHeaders()
                    }
                }

                self.delegate.success()
            case .failure(let error):
                
                self.delegate.failure(error: error.localizedDescription)
            }
        })
    }
    
    func postLogin(email: String, senha: String) {
        AutenticacaoRequestFactory.postLogin(email: email, senha: senha).validate().responseObject(keyPath: "data", completionHandler: { (response: DataResponse<Usuario>) in
            
            switch response.result {
                
            case .success:
                
                if let usuario = response.result.value {
                    
                    if let client = response.response?.allHeaderFields["Client"] as? String,
                        let token = response.response?.allHeaderFields["Access-Token"] as? String,
                        let uid = response.response?.allHeaderFields["Uid"] as? String {
                        
                        usuario.token = token
                        usuario.client = client
                        usuario.uid = uid
                        
                        UsuarioViewModel.save(object: usuario)
                        
                        SessionControl.setHeaders()
                    }
                }
                
                self.delegate.success()
            case .failure(let error):
                
                self.delegate.failure(error: error.localizedDescription)
            }
        })
    }
}
