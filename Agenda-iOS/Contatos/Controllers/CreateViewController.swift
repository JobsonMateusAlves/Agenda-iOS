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
    
    var service: ContatosService!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = L10n.Contatos.Criar.title
        
        self.setupCloseButton()
        
        self.service = ContatosService(delegate: self)
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
            
            self.service.postContato(contatoView: contato)
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
