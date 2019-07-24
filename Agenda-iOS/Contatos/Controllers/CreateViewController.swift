//
//  CreateViewController.swift
//  Agenda-iOS
//
//  Created by administrador on 23/07/19.
//  Copyright © 2019 administrador. All rights reserved.
//

import UIKit

class CreateViewController: UIViewController {
    
    @IBOutlet weak var nomeTextField: UITextField!
    @IBOutlet weak var nascimentoTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var telefoneTextField: UITextField!
    @IBOutlet weak var imageTextField: UITextField!
    @IBOutlet weak var button: UIButton!
    
    var service: ContatosService!
    var contatoId: Int?
    var contato: ContatoView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = L10n.Contatos.Criar.title
        
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "", style: .plain, target: nil, action: nil)
        
        self.service = ContatosService(delegate: self)
        
        if let id = self.contatoId {
            self.contato = ContatoViewModel.get(by: id)
        } else {
            self.setupCloseButton()
        }
        
        if let contato = self.contato {
            
            self.nomeTextField.text = contato.name
            self.nascimentoTextField.text =
                String(contato.birth)
            self.emailTextField.text = contato.email
            self.telefoneTextField.text = contato.phone
            self.imageTextField.text = contato.picture
            
            self.button.setTitle("Editar", for: .normal)
        } else {
            self.button.setTitle("Criar", for: .normal)
        }
    }
    
    func setupCloseButton() {
        
        let button = UIBarButtonItem.init(title: L10n.Common.fechar, style: .done, target: self, action: #selector(CreateViewController.close))
        
        self.navigationItem.rightBarButtonItem = button
    }
    
    @objc func close() {
        self.dismiss(animated: true)
    }
    
    @IBAction func criarAction(_ sender: Any) {
        
        
        if let nome = self.nomeTextField.text,
            let telefone = self.telefoneTextField.text,
            let nascimento = self.nascimentoTextField.text,
            let email = self.emailTextField.text,
            let imagem = self.imageTextField.text {
            
            let contato = ContatoView(id: 0, name: nome, email: email, phone: telefone, picture: imagem, birth: Double(Int(nascimento) ?? 0))
            
            if let contatoView = self.contato {
                //servico de editar
            } else {
                self.service.postContato(contatoView: contato)
            }
        }
    }
}

extension CreateViewController: ContatosServiceDelegate {
    func success() {
        self.dismiss(animated: true)
    }
    
    func failure(error: String) {
        print(error)
    }
}
