//
//  ContatosService.swift
//  Agenda-iOS
//
//  Created by administrador on 23/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import Alamofire
import AlamofireObjectMapper

protocol ContatosServiceDelegate {
    
    func success()
    func failure(error: String)
}

class ContatosService {
    
    var delegate: ContatosServiceDelegate!
    
    init(delegate: ContatosServiceDelegate) {
        self.delegate = delegate
    }
    
    func getContatos() {
        ContatosRequestFactory.getContatos().validate().responseArray { (response: DataResponse<[Contato]>) in
            
            switch response.result {
                
            case .success:
                
                if let contatos = response.result.value {
                    ContatoViewModel.saveAll(objects: contatos, clear: true)
                }
                
                self.delegate.success()
                
            case .failure(let error):
                
                self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
    func postContato(contatoView: ContatoView) {
        
        let contato = ContatoViewModel.getAsModel(contatoView: contatoView)
        
        ContatosRequestFactory.postContato(contato: contato).validate().responseObject { (response: DataResponse<Contato>) in
            
            switch response.result {
            case .success:
                
                if let contato = response.result.value {
                    ContatoViewModel.saveAll(objects: [contato])
                }
                self.delegate.success()
                
            case .failure(let error):
                
                self.delegate.failure(error: error.localizedDescription)
            }
        }
    }
    
}
