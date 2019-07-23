//
//  ContatoViewModel.swift
//  Agenda-iOS
//
//  Created by administrador on 23/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import Foundation
import RealmSwift

struct ContatoView {
    
    var id = 0
    var name = ""
    var email = ""
    var phone = ""
    var picture = ""
    var birth: Double = 0
}

class ContatoViewModel {
    
    static func saveAll(objects: [Contato], clear: Bool = false) {
        
        if clear {
            self.deleteContatos()
        }
        
        try? uiRealm.write {
            
            uiRealm.add(objects, update: .all)
        }
    }
    
    static func getAsView(contato: Contato?) -> ContatoView {
        
        guard let contato = contato else {
            return ContatoView()
        }
        
        var contatoView = ContatoView()
        contatoView.id = contato.id.value ?? 0
        contatoView.name = contato.name ?? ""
        contatoView.email = contato.email ?? ""
        contatoView.phone = contato.phone ?? ""
        contatoView.picture = contato.picture ?? ""
        contatoView.birth = contato.birth.value ?? 0
        
        return contatoView
    }
    
    static func getAsView(contatos: [Contato]) -> [ContatoView] {
        
        var contatosView: [ContatoView] = []
        
        contatos.forEach { (contato) in
            
            contatosView.append(self.getAsView(contato: contato))
        }
        
        return contatosView
    }
    
    static func get() -> [Contato] {
        let results = uiRealm.objects(Contato.self)
        
        var contatos: [Contato] = []
        contatos.append(contentsOf: results)
        
        return contatos
    }
    
    static func getContatos() -> [ContatoView] {
        
        return self.getAsView(contatos: self.get())
    }
    
    static func deleteContatos() {
        let results = uiRealm.objects(Contato.self)
        
        try? uiRealm.write {
            
            uiRealm.delete(results)
        }
    }
}
